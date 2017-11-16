//
//  GraphView.h
//  Pods
//
//  Created by Dan Kalinin on 8/15/17.
//
//

#import <UIKit/UIKit.h>
#import "View.h"

@class GraphView;

typedef NS_ENUM(NSUInteger, GraphViewType) {
    GraphViewTypeLine,
    GraphViewTypeColumn
};










@protocol GraphViewDataSource <NSObject>

- (NSUInteger)numberOfPointsOnGraphView:(GraphView *)graphView;
- (CGPoint)graphView:(GraphView *)graphView pointAtIndex:(NSUInteger)index;

@end










@interface GraphView : GradientLayerView2

@property (weak, nonatomic) IBOutlet UILabel *headerLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *headerLeftDetailLabel;

@property (weak, nonatomic) IBOutlet UILabel *headerRightLabel;
@property (weak, nonatomic) IBOutlet UILabel *headerRightDetailLabel;

@property (weak, nonatomic) IBOutlet UILabel *yMinimumLabel;
@property (weak, nonatomic) IBOutlet UILabel *yMaximumLabel;

@property (weak, nonatomic) IBOutlet UILabel *noDataLabel;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *xLabels;

@property IBInspectable GraphViewType type;

@property IBInspectable UIColor *graphColor;
@property IBInspectable UIColor *axisColor;

@property UIFloatRange xRange;
@property UIFloatRange yRange;

@property (weak) id <GraphViewDataSource> dataSource;

@end










@interface GraphViewController : UIViewController <GraphViewDataSource>

@property (nonatomic) GraphView *view;

@end
