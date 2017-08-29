//
//  TableViewCell.h
//  Pods
//
//  Created by Dan Kalinin on 03.03.17.
//
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>
#import "NumberPickerControl.h"
#import "MultiselectionControl.h"

@class TableView;

typedef NS_ENUM(NSUInteger, TableViewRowReorderingPolicy) {
    TableViewRowReorderingPolicyNone,
    TableViewRowReorderingPolicyInSection
};










@protocol TableViewDataSource <UITableViewDataSource>

@optional
- (void)tableView:(TableView *)tableView configureHeaderView:(UITableViewHeaderFooterView *)headerView forSection:(NSInteger)section;
- (void)tableView:(TableView *)tableView configureFooterView:(UITableViewHeaderFooterView *)footerView forSection:(NSInteger)section;

// Collapsing

- (BOOL)tableView:(TableView *)tableView isCollapsedSection:(NSInteger)section;

// Grouping

- (BOOL)tableView:(TableView *)tableView canGroupRowAtIndexPath:(NSIndexPath *)sourceIndexPath withIndexPath:(NSIndexPath *)destinationIndexPath;
- (void)tableView:(TableView *)tableView groupRowAtIndexPath:(NSIndexPath *)sourceIndexPath withIndexPath:(NSIndexPath *)destinationIndexPath;

@end










@protocol TableViewDelegate <UITableViewDelegate>

@optional
- (CGFloat)tableView:(TableView *)tableView heightForCollapsedRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)tableView:(TableView *)tableView heightForExpandedRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)tableView:(TableView *)tableView didToggleSelectAllButton:(UIButton *)button;

// Collapsing

- (void)tableView:(TableView *)tableView didCollapse:(BOOL)collapse section:(NSInteger)section;

// Grouping

- (void)tableView:(TableView *)tableView indexPath:(NSIndexPath *)sourceIndexPath didIntersect:(BOOL)intersect indexPath:(NSIndexPath *)destinationIndexPath;

@end










@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet ImageView *imageView1;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraint1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraint2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraint3;

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;

@property (weak, nonatomic) IBOutlet UIStackView *stackView1;

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@property (weak, nonatomic) IBOutlet UILabel *label6;
@property (weak, nonatomic) IBOutlet UILabel *label7;
@property (weak, nonatomic) IBOutlet UILabel *label8;
@property (weak, nonatomic) IBOutlet UILabel *label9;
@property (weak, nonatomic) IBOutlet UILabel *label10;

@property (weak, nonatomic) IBOutlet UITextField *textField1;

@property (weak, nonatomic) IBOutlet UIControl *control1;

@property (weak, nonatomic) IBOutlet Button *button1;

@property (weak, nonatomic) IBOutlet UISwitch *switch1;

@property (weak, nonatomic) IBOutlet UISlider *slider1;

@property (weak, nonatomic) IBOutlet TimePickerControl *timePickerControl1;

@property (weak, nonatomic) IBOutlet MultiselectionControl *multiselectionControl1;

@property IBInspectable UITableViewCellAccessoryType defaultAccessoryType;
@property IBInspectable UITableViewCellAccessoryType selectedAccessoryType;
@property IBInspectable BOOL editable;
@property IBInspectable CGFloat height;

@property IBInspectable NSString *storyboard;
@property IBInspectable NSString *viewController;

@property IBInspectable CGFloat groupInset;

@property NSIndexPath *indexPath;
@property id userInfo;

@property (readonly) UITableViewCellStateMask state;

@end










@interface TableViewHeaderFooterView : UITableViewHeaderFooterView

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;

@property (weak, nonatomic) IBOutlet Button *button1;
@property (weak, nonatomic) IBOutlet Button *button2;
@property (weak, nonatomic) IBOutlet Button *button3;

@end










@interface TableViewCellVerticalSeparator : GradientLayerView

@property IBInspectable UIColor *topColor;
@property IBInspectable UIColor *centerColor;
@property IBInspectable UIColor *bottomColor;

@end










@interface TableView : UITableView

@property (weak, nonatomic) IBOutlet Button *selectAllButton;

@property (strong, nonatomic) IBOutlet UIView *backgroundView;
@property (strong, nonatomic) IBOutlet UIView *emptyView;

@property IBInspectable UITableViewCellSeparatorStyle defaultSeparatorStyle;

@property IBInspectable NSString *headerViewNibIdentifier;
@property IBInspectable NSString *headerViewNibName;

@property IBInspectable NSString *footerViewNibIdentifier;
@property IBInspectable NSString *footerViewNibName;

@property IBInspectable BOOL sectionsCollapsible;
@property IBInspectable BOOL sectionsCollapsed;

@property IBInspectable BOOL rowsCollapsible;
@property IBInspectable BOOL rowsCollapsed;

@property IBInspectable BOOL canMoveRows;
@property IBInspectable BOOL canMoveSingleRow;
@property IBInspectable TableViewRowReorderingPolicy rowReorderingPolicy;

@property IBInspectable BOOL groupCells;

- (IBAction)onHeaderView:(UIButton *)sender;

@end










@interface TableViewController : UITableViewController <TableViewDataSource, TableViewDelegate>

@property (nonatomic) TableView *view;
@property (nonatomic) TableView *tableView;

@property (strong, nonatomic) IBOutletCollection(UITableViewCell) NSArray *cells;

@end
