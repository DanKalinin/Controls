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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end










@interface GraphViewController ()

@end



@implementation GraphViewController

@dynamic view;

#pragma mark - Graph view

- (NSUInteger)numberOfPointsOnGraphView:(GraphView *)graphView {
    return 0;
}

- (CGPoint)graphView:(GraphView *)graphView pointAtIndex:(NSUInteger)index {
    return CGPointZero;
}

@end
