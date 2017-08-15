//
//  GraphView.h
//  Pods
//
//  Created by Dan Kalinin on 8/15/17.
//
//

#import <Helpers/Helpers.h>

@class GraphView;



@protocol GraphViewDataSource <NSObject>

- (NSUInteger)numberOfPointsOnGraphView:(GraphView *)graphView;
- (CGPoint)graphView:(GraphView *)graphView pointAtIndex:(NSUInteger)index;

@end



@interface GraphView : GradientLayerView

@property UILabel *headerLeftLabel;
@property UILabel *headerLeftDetailLabel;

@property UILabel *headerRightLabel;
@property UILabel *headerRightDetailLabel;

@property UILabel *yMinimumLabel;
@property UILabel *yMaximumLabel;

@property UIFloatRange xRange;
@property UIFloatRange yRange;
@property NSArray<UILabel *> *xLabels;

@end
