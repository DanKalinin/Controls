//
//  CTLTableView.h
//  Controls
//
//  Created by Dan Kalinin on 6/5/18.
//

#import <UIKit/UIKit.h>
#import "CTLButton.h"
#import "CTLTextField.h"
#import "CTLActivityIndicatorView.h"
#import "CTLAlert.h"

@class CTLTableViewCell, CTLTableView, CTLTableViewController, CTLTableViewRowAction;










@interface CTLTableViewCell : UITableViewCell

@property (weak) IBOutlet CTLButton *weakButton1;
@property (weak) IBOutlet CTLButton *weakButton2;

@property (weak) IBOutlet CTLTextField *weakTextField1;

@property (weak) IBOutlet CTLActivityIndicatorView *weakActivityIndicatorView1;

@property (readonly) BOOL enabled;

- (void)setEnabled:(BOOL)enabled animated:(BOOL)animated;

@end










@interface CTLTableView : UITableView

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
