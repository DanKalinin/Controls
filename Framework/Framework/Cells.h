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










@interface CollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView1;

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;

@property (weak, nonatomic) IBOutlet UITextField *textField1;

@property (weak, nonatomic) IBOutlet UIControl *control1;

@end
