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










@protocol TableViewDelegate <UITableViewDelegate>

@optional
- (void)tableView:(UITableView *)tableView configureHeaderView:(UITableViewHeaderFooterView *)headerView forSection:(NSInteger)section;
- (void)tableView:(UITableView *)tableView configureFooterView:(UITableViewHeaderFooterView *)footerView forSection:(NSInteger)section;

@end










@interface TableView : UITableView

@property (strong, nonatomic) IBOutlet UIView *backgroundView;
@property (strong, nonatomic) IBOutlet UIView *emptyView;

@property IBInspectable NSString *headerViewNibIdentifier;
@property IBInspectable NSString *headerViewNibName;

@property IBInspectable NSString *footerViewNibIdentifier;
@property IBInspectable NSString *footerViewNibName;

@property IBInspectable BOOL collapsible;
@property IBInspectable BOOL collapsed;

- (IBAction)onHeaderView:(UIButton *)sender;

@end










@interface TableViewHeaderFooterView : UITableViewHeaderFooterView

@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;

@end










@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet ImageView *imageView1;

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;

@property (weak, nonatomic) IBOutlet UITextField *textField1;

@property (weak, nonatomic) IBOutlet UIControl *control1;

@property (weak, nonatomic) IBOutlet UIButton *button1;

@property (weak, nonatomic) IBOutlet UISwitch *switch1;

@property (weak, nonatomic) IBOutlet UISlider *slider1;

@property (weak, nonatomic) IBOutlet TimePickerControl *timePickerControl1;

@property (weak, nonatomic) IBOutlet MultiselectionControl *multiselectionControl1;

@property IBInspectable NSInteger selectedAccessoryType;
@property IBInspectable BOOL editable;

@property IBInspectable NSString *storyboard;
@property IBInspectable NSString *viewController;

@property id userInfo;

@end










@interface TableViewCellVerticalSeparator : GradientLayerView

@property IBInspectable UIColor *topColor;
@property IBInspectable UIColor *centerColor;
@property IBInspectable UIColor *bottomColor;

@end
