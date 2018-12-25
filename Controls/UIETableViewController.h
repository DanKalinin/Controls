//
//  UIETableViewController.h
//  Controls
//
//  Created by Dan Kalinin on 12/20/18.
//

#import <UIKit/UIKit.h>
#import "UITableViewController.h"
#import "UIETableView.h"

@class UIETableViewController;
@class UIETableViewControllerOperation;

@protocol UIETableViewControllerOperationDelegate;










@interface UIETableViewController : UITableViewController <UIETableViewOperationDelegate>

@property (nonatomic) UIETableView *view;
@property (nonatomic) UIETableView *tableView;

@property (readonly) Class operationClass;
@property (readonly) UIETableViewControllerOperation *operation;

@end










@protocol UIETableViewControllerOperationDelegate <UITableViewControllerOperationDelegate>

@end



@interface UIETableViewControllerOperation : UITableViewControllerOperation <UIETableViewControllerOperationDelegate>

@property (weak, readonly) UIETableViewController *weakObject;

@end
