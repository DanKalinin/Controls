//
//  GraphView.m
//  Pods
//
//  Created by Dan Kalinin on 8/15/17.
//
//

#import "GraphView.h"










@interface GraphView ()

@property CGFloat average;

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
    
    // Preparation
    
    CGFloat dx = self.xRange.maximum - self.xRange.minimum;
    CGFloat dy = self.yRange.maximum - self.yRange.minimum;
    CGFloat kx = axisRect.size.width / dx;
    CGFloat ky = axisRect.size.height / dy;
    
    CGPoint points[count];
    self.average = 0.0;
    CGFloat average = 0.0;
    for (NSUInteger index = 0; index < count; index++) {
        point = [self.dataSource graphView:self pointAtIndex:index];
        self.average += point.y;
        
        point.x = CGRectGetMinX(axisRect) + point.x * kx;
        point.y = CGRectGetMaxY(axisRect) - point.y * ky;
        average += point.y;
        
        points[index] = point;
    }
    
    self.average /= count;
    average /= count;
    
    CGFloat pattern[] = {2.0, 1.0};
    
    // Lines
    
    path = UIBezierPath.bezierPath;
    
    path.lineWidth = 1.0;
    [self.graphColor setStroke];
    
    for (NSUInteger index = 0; index < count; index++) {
        point = points[index];
        (index == 0) ? [path moveToPoint:point] : [path addLineToPoint:point];
    }
    
    [path stroke];
    
    // Points
    
    path = UIBezierPath.bezierPath;
    
    path.lineWidth = 2.0;
    [self.graphColor setStroke];
    
    for (NSUInteger index = 0; index < count; index++) {
        point = points[index];
        [path moveToPoint:point];
        [path addArcWithCenter:point radius:2.5 startAngle:0.0 endAngle:(2.0 * M_PI) clockwise:YES];
    }
    
    [path stroke];
    
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    NSUInteger count = [self.dataSource numberOfPointsOnGraphView:self];
//    self.noDataLabel.hidden = (count > 0);
//    if (count == 0) return;
//    
//    UIEdgeInsets graphInsets;
//    graphInsets.top = 44.0;
//    graphInsets.bottom = 34.0;
//    graphInsets.left = 12.0;
//    graphInsets.right = 12.0;
//    
//    CGRect graphRect = UIEdgeInsetsInsetRect(self.bounds, graphInsets);
//    CGFloat dx = self.xRange.maximum - self.xRange.minimum;
//    CGFloat dy = self.yRange.maximum - self.yRange.minimum;
//    CGFloat kx = graphRect.size.width / dx;
//    CGFloat ky = graphRect.size.height / dy;
    
//    CGAffineTransform graphTransform = CGAffineTransformMakeTranslation(graphInsets.left, graphInsets.top + graphRect.size.height);
//    graphTransform = CGAffineTransformScale(graphTransform, kx, -ky);
//    
//    path = UIBezierPath.bezierPath;
//    
//    path.lineWidth = 1.0;
//    [self.graphColor setStroke];
//    
//    CGFloat avg = 0;
//    for (NSUInteger index = 0; index < count; index++) {
//        point = [self.dataSource graphView:self pointAtIndex:index];
//        (index == 0) ? [path moveToPoint:point] : [path addLineToPoint:point];
//        avg += point.y;
//    }
//    avg /= count;
//    
//    [path applyTransform:graphTransform];
//    [path stroke];
//    
//    CGFloat pattern[] = {2.0, 1.0};
//    
//    path = UIBezierPath.bezierPath;
//    
//    path.lineWidth = 0.5;
//    [path setLineDash:pattern count:2 phase:0];
//    [self.axisColor setStroke];
//    
//    point.x = 0.0;
//    point.y = avg;
//    [path moveToPoint:point];
//    
//    point.x = graphRect.size.width;
//    [path addLineToPoint:point];
//    
//    [path applyTransform:graphTransform];
//    [path stroke];
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
