//
//  GraphView.m
//  Pods
//
//  Created by Dan Kalinin on 8/15/17.
//
//

#import "GraphView.h"
#import <Helpers/Helpers.h>










@interface GraphView ()

@end



@implementation GraphView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = UIColor.clearColor;
}

- (void)drawRect:(CGRect)rect {
    
    // Preparation
    
    UIEdgeInsets axisInsets;
    axisInsets.left = 12.0;
    axisInsets.right = 12.0;
    axisInsets.top = 44.0;
    axisInsets.bottom = 34.0;
    
    CGRect axisRect = UIEdgeInsetsInsetRect(self.bounds, axisInsets);
    
    UIBezierPath *path;
    CGPoint point;
    
    // Axes
    
    path = UIBezierPath.bezierPath;
    
    path.lineWidth = 0.5;
    [self.axisColor setStroke];
    
    point = axisRect.origin;
    [path moveToPoint:point];
    
    point.x = CGRectGetMaxX(axisRect);
    [path addLineToPoint:point];
    
    point.y = CGRectGetMaxY(axisRect);
    [path moveToPoint:point];
    
    point.x = CGRectGetMinX(axisRect);
    [path addLineToPoint:point];
    
    [path stroke];
    
    // No data
    
    NSUInteger count = [self.dataSource numberOfPointsOnGraphView:self];
    BOOL hasData = (count > 0);
    self.noDataLabel.hidden = hasData;
    if (!hasData) return;
    
    // Preparation
    
    CGFloat dx = self.xRange.maximum - self.xRange.minimum;
    CGFloat dy = self.yRange.maximum - self.yRange.minimum;
    CGFloat kx = axisRect.size.width / dx;
    CGFloat ky = axisRect.size.height / dy;
    
    CGPoint points[count];
    CGFloat average = 0.0;
    NSUInteger index;
    for (index = 0; index < count; index++) {
        point = [self.dataSource graphView:self pointAtIndex:index];
        
        point.x = CGRectGetMinX(axisRect) + kx * point.x;
        point.y = CGRectGetMaxY(axisRect) - ky * point.y;
        average += point.y;
        
        points[index] = point;
    }
    
    average /= count;
    
    CGFloat pattern[] = {2.0, 1.0};
    
    if (self.type == GraphViewTypeLine) {
        
        // Preparation
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        UIColor *fillColor = [UIColor colorWithColors:self.layer.uiColors];
        
        CGPoint radialPoint;
        
        // Gradient
        
        CGContextSaveGState(context);
        
        path = UIBezierPath.bezierPath;
        
        path.lineWidth = 0.0;
        
        for (index = 0; index < count; index++) {
            point = points[index];
            (index == 0) ? [path moveToPoint:point] : [path addLineToPoint:point];
        }
        
        point = path.currentPoint;
        point.y = CGRectGetMaxY(axisRect);
        [path addLineToPoint:point];
        
        point = points[0];
        point.y = CGRectGetMaxY(axisRect);
        [path addLineToPoint:point];
        
        [path closePath];
        [path addClip];
        
        CGFloat rStart, gStart, bStart, aStart;
        CGFloat rEnd, gEnd, bEnd, aEnd;
        
        UIColor *startColor = [self.graphColor colorWithAlphaComponent:0.75];
        UIColor *endColor = [self.graphColor colorWithAlphaComponent:0.05];
        
        [startColor getRed:&rStart green:&gStart blue:&bStart alpha:&aStart];
        [endColor getRed:&rEnd green:&gEnd blue:&bEnd alpha:&aEnd];
        
        CGColorSpaceRef space = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
        CGFloat components[8] = {rStart, gStart, bStart, aStart, rEnd, gEnd, bEnd, aEnd};
        CGFloat locations[2] = {0.0, 1.0};
        
        CGGradientRef gradient = CGGradientCreateWithColorComponents(space, components, locations, 2);
        
        CGPoint startPoint = CGPointMake(0.0, CGRectGetMinY(axisRect));
        CGPoint endPoint = CGPointMake(0.0, CGRectGetMaxY(axisRect));
        
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
        
        CGContextRestoreGState(context);
        
        // Lines
        
        path = UIBezierPath.bezierPath;
        
        path.lineWidth = 1.0;
        [self.graphColor setStroke];
        
        for (index = 0; index < count; index++) {
            point = points[index];
            (index == 0) ? [path moveToPoint:point] : [path addLineToPoint:point];
        }
        
        [path stroke];
        
        // Points
        
        path = UIBezierPath.bezierPath;
        
        path.lineWidth = 2.0;
        [self.graphColor setStroke];
        [fillColor setFill];
        
        for (index = 0; index < count; index++) {
            point = points[index];
            
            radialPoint = point;
            radialPoint.x += 2.5;
            
            [path moveToPoint:radialPoint];
            [path addArcWithCenter:point radius:2.5 startAngle:0.0 endAngle:(2.0 * M_PI) clockwise:YES];
        }
        
        [path fill];
        [path stroke];
        
    } else if (self.type == GraphViewTypeColumn) {
        
        path = UIBezierPath.bezierPath;
        
        path.lineWidth = 5.0;
        path.lineCapStyle = kCGLineCapRound;
        [self.graphColor setStroke];
        
        for (index = 0; index < count; index++) {
            point = points[index];
            [path moveToPoint:point];
            
            point.y = CGRectGetMaxY(axisRect) - 5.0;
            [path addLineToPoint:point];
        }
        
        [path stroke];
        
    }
    
    // Average
    
    path = UIBezierPath.bezierPath;
    
    path.lineWidth = 0.5;
    [path setLineDash:pattern count:2 phase:0.0];
    [self.axisColor setStroke];
    
    point.x = CGRectGetMinX(axisRect);
    point.y = average;
    [path moveToPoint:point];
    
    point.x = CGRectGetMaxX(axisRect);
    [path addLineToPoint:point];
    
    [path stroke];
}

@end










@interface GraphViewController ()

@end



@implementation GraphViewController

@dynamic view;

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.view.dataSource = self;
}

#pragma mark - Graph view

- (NSUInteger)numberOfPointsOnGraphView:(GraphView *)graphView {
    return 0;
}

- (CGPoint)graphView:(GraphView *)graphView pointAtIndex:(NSUInteger)index {
    return CGPointZero;
}

@end
