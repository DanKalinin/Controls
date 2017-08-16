//
//  GraphView.m
//  Pods
//
//  Created by Dan Kalinin on 8/15/17.
//
//

#import "GraphView.h"










@interface GraphView ()

@end



@implementation GraphView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = UIColor.clearColor;
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = UIBezierPath.bezierPath;
    
    path.lineWidth = 0.5;
    [self.axisColor setStroke];
    
    CGPoint point;
    point.x = 12.0;
    point.y = 44.0;
    [path moveToPoint:point];
    
    point.x = self.bounds.size.width - 12.0;
    [path addLineToPoint:point];
    
    point.y = self.bounds.size.height - 34.0;
    [path moveToPoint:point];
    
    point.x = 12.0;
    [path addLineToPoint:point];
    
    [path stroke];
    
    NSUInteger count = [self.dataSource numberOfPointsOnGraphView:self];
    self.noDataLabel.hidden = (count > 0);
    if (count == 0) return;
    
    UIEdgeInsets graphInsets;
    graphInsets.top = 44.0;
    graphInsets.bottom = 34.0;
    graphInsets.left = 20.0;
    graphInsets.right = 30.0;
    
    CGRect graphRect = UIEdgeInsetsInsetRect(self.bounds, graphInsets);
    CGFloat dx = self.xRange.maximum - self.xRange.minimum;
    CGFloat dy = self.yRange.maximum - self.yRange.minimum;
    CGFloat kx = graphRect.size.width / dx;
    CGFloat ky = graphRect.size.height / dy;
    
    CGAffineTransform graphTransform = CGAffineTransformMakeTranslation(graphInsets.left, graphInsets.top + graphRect.size.height);
    graphTransform = CGAffineTransformScale(graphTransform, kx, -ky);
    
    path = UIBezierPath.bezierPath;
    
    path.lineWidth = 1.0;
    [self.graphColor setStroke];
    
    CGFloat avg = 0;
    for (NSUInteger index = 0; index < count; index++) {
        point = [self.dataSource graphView:self pointAtIndex:index];
        (index == 0) ? [path moveToPoint:point] : [path addLineToPoint:point];
        avg += point.y;
    }
    avg /= count;
    
    [path applyTransform:graphTransform];
    [path stroke];
    
    CGFloat pattern[] = {2.0, 1.0};
    
    path = UIBezierPath.bezierPath;
    
    path.lineWidth = 0.5;
    [path setLineDash:pattern count:2 phase:0];
    [self.axisColor setStroke];
    
    point.x = 0.0;
    point.y = avg;
    [path moveToPoint:point];
    
    point.x = graphRect.size.width;
    [path addLineToPoint:point];
    
    [path applyTransform:graphTransform];
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
