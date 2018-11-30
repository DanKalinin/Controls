//
//  CTLTableView.h
//  Controls
//
//  Created by Dan Kalinin on 6/5/18.
//

#import <UIKit/UIKit.h>
#import "UIEButton.h"
#import "UIETextField.h"
#import "CTLAlert.h"

@class CTLTableViewCell, CTLTableView, CTLTableViewController, CTLTableViewRowAction;










@interface CTLTableViewCell : UITableViewCell

@property (weak) IBOutlet UIEButton *weakButton1;
@property (weak) IBOutlet UIEButton *weakButton2;

@property (weak) IBOutlet UIETextField *weakTextField1;

@property (weak) IBOutlet UIActivityIndicatorView *weakActivityIndicatorView1;

@property (readonly) BOOL enabled;

- (void)setEnabled:(BOOL)enabled animated:(BOOL)animated;

@end










@interface CTLTableView : UITableView

@property IBOutlet UIView *emptyBackgroundView;

@end










@interface CTLTableViewController : UITableViewController

@property (nonatomic) CTLTableView *tableView;

@end










@protocol CTLTableViewRowActionDelegate <CTLActionDelegate>

@optional
- (void)CTLTableViewRowActionDidEnd:(CTLTableViewRowAction *)action;

@end



@interface CTLTableViewRowAction : CTLAction <CTLTableViewRowActionDelegate>

@property (readonly) HLPArray<CTLTableViewRowActionDelegate> *delegates;
@property (readonly) UITableViewRowAction *action;
@property (readonly) NSIndexPath *indexPath;

- (instancetype)initWithTitle:(NSString *)title style:(UITableViewRowActionStyle)style identifier:(NSString *)identifier delegate:(id<CTLTableViewRowActionDelegate>)delegate;

@end
