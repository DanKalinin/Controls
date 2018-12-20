//
//  UIETableViewController.h
//  Controls
//
//  Created by Dan Kalinin on 12/20/18.
//

#import <UIKit/UIKit.h>
#import "UIViewController.h"
#import "UIETableView.h"

@class UIETableViewController;
@class UIETableViewControllerOperation;










@interface UIETableViewController : UITableViewController <UIETableViewOperationDelegate>

@property (nonatomic) UIETableView *tableView;

@property (readonly) Class operationClass;
@property (readonly) UIETableViewControllerOperation *operation;

@end










@protocol UIETableViewControllerOperationDelegate <UIViewControllerOperationDelegate>

@end



@interface UIETableViewControllerOperation : UIViewControllerOperation <UIETableViewControllerOperationDelegate>

@property (weak, readonly) UIETableViewController *viewController;

@end
