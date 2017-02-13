//
//  SectorControl.m
//  SectorControl
//
//  Created by Dan Kalinin on 1/31/17.
//  Copyright © 2017 Dan Kalinin. All rights reserved.
//

#import "SectorControl.h"
#import <GLKit/GLKit.h>










@interface SectorControlConfiguration ()

@end



@implementation SectorControlConfiguration

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.disabledAlpha = 0.5;
        self.enabled = YES;
    }
    return self;
}

@end










@interface SectorControl ()

@property FilledButton *sector;
@property NSArray *paths;

@end



@implementation SectorControl

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setConfiguration:self.configuration];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGPoint center = CGRectGetMidXMidY(self.bounds);
    CGFloat outerRadius = 0.5 * (self.bounds.size.width - self.configuration.borderWidth);
    CGFloat innerRadius = outerRadius - self.configuration.sectorWidth;
    CGFloat startAngle = GLKMathDegreesToRadians(self.configuration.startAngle);
    CGFloat sectorAngle = 2.0 * M_PI / self.configuration.sectors.count;
    
    NSMutableArray *paths = [NSMutableArray array];
    for (NSUInteger index = 0; index < self.configuration.sectors.count; index++) {
        CGFloat endAngle = startAngle + sectorAngle;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:outerRadius startAngle:startAngle endAngle:endAngle clockwise:YES];
        [path addArcWithCenter:center radius:innerRadius startAngle:endAngle endAngle:startAngle clockwise:NO];
        [path closePath];
        path.lineWidth = self.configuration.borderWidth;
        [paths addObject:path];
        startAngle = endAngle;
    }
    
    self.paths = paths;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    for (NSUInteger index = 0; index < self.configuration.sectors.count; index++) {
        FilledButton *sector = self.configuration.sectors[index];
        UIBezierPath *path = self.paths[index];
        
        UIColor *fillColor = sector.backgroundColor;
        UIColor *strokeColor = sector.borderColor;
        NSString *title = [sector titleForState:UIControlStateNormal];
        UIColor *titleColor = [sector titleColorForState:UIControlStateNormal];
        
        if (sector.state & UIControlStateSelected) {
            fillColor = sector.selectedBackgroundColor;
            strokeColor = sector.selectedBorderColor;
            titleColor = [sector titleColorForState:UIControlStateSelected];
        }
        
        [fillColor setFill];
        [strokeColor setStroke];
        
        [path fill];
        [path stroke];
        
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        attributes[NSFontAttributeName] = sector.titleLabel.font;
        attributes[NSForegroundColorAttributeName] = titleColor;
        
        CGSize size = [title sizeWithAttributes:attributes];
        
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        CGContextSaveGState(ctx);
        
        CGContextTranslateCTM(ctx, sector.center.x, sector.center.y);
        CGContextConcatCTM(ctx, sector.layer.affineTransform);
        CGContextTranslateCTM(ctx, -0.5 * size.width, -0.5 * size.height);
        
        [title drawAtPoint:CGPointZero withAttributes:attributes];
        
        CGContextRestoreGState(ctx);
    }
}

- (void)selectSector:(FilledButton *)sector animated:(BOOL)animated {
    
    self.sector = sector;
    
    [self.configuration.sectors setValue:@NO forKey:@"selected"];
    sector.selected = YES;
    
    [self setNeedsDisplay];
}

#pragma mark - Accessors

- (void)setConfiguration:(SectorControlConfiguration *)configuration {
    _configuration = configuration;
    
    [configuration.sectors setValue:@YES forKey:@"hidden"];
    
    self.enabled = configuration.enabled;
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    
    self.alpha = enabled ? 1.0 : self.configuration.disabledAlpha;
}

#pragma mark - Actions

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    
    CGPoint point = [touch locationInView:self];
    NSUInteger index = NSNotFound;
    UIBezierPath *path;
    for (NSUInteger i = 0; i < self.paths.count; i++) {
        path = self.paths[i];
        if ([path containsPoint:point]) {
            index = i;
            break;
        }
    }
    
    if (index != NSNotFound) {
        FilledButton *sector = self.configuration.sectors[index];
        BOOL same = [sector isEqual:self.sector];
        if (same && self.configuration.deselactable && self.sector.selected) {
            sector = nil;
        }
        [self selectSector:sector animated:NO];
        if (!same || !sector) {
            [self sendActionsForControlEvents:UIControlEventValueChanged];
        }
    }
    
    return NO;
}

@end
