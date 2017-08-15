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

@property (weak, nonatomic) IBOutlet UILabel *headerLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *headerLeftDetailLabel;

@property (weak, nonatomic) IBOutlet UILabel *headerRightLabel;
@property (weak, nonatomic) IBOutlet UILabel *headerRightDetailLabel;

@property (weak, nonatomic) IBOutlet UILabel *yMinimumLabel;
@property (weak, nonatomic) IBOutlet UILabel *yMaximumLabel;

@property (weak, nonatomic) IBOutlet UILabel *noDataLabel;

@property UIFloatRange xRange;
@property UIFloatRange yRange;
@property NSArray<UILabel *> *xLabels;

@property (weak) id <GraphViewDataSource> dataSource;

@end










@interface GraphViewController : UIViewController <GraphViewDataSource>

@property (nonatomic) GraphView *view;

@end
