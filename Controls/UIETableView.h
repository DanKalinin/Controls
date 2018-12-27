//
//  UIETableView.h
//  Controls
//
//  Created by Dan Kalinin on 11/29/18.
//

#import <UIKit/UIKit.h>
#import "UITableView.h"
#import "UIEAction.h"

@class UIETableView;
@class UIETableViewRowAction;

@protocol UIETableViewRowActionDelegate;











@interface UIETableView : UITableView

@end










@protocol UIETableViewRowActionDelegate <UIEActionDelegate>

@optional
- (void)UIETableViewRowActionDidFinish:(UIETableViewRowAction *)rowAction;

@end



@interface UIETableViewRowAction : UIEAction <UIETableViewRowActionDelegate>

@property (readonly) HLPArray<UIETableViewRowActionDelegate> *delegates;
@property (readonly) UITableViewRowAction *rowAction;
@property (readonly) NSIndexPath *indexPath;

- (instancetype)initWithStyle:(UITableViewRowActionStyle)style title:(NSString *)title identifier:(NSString *)identifier delegate:(id<UIETableViewRowActionDelegate>)delegate;

@end
