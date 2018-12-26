//
//  UITableViewController.h
//  Controls
//
//  Created by Dan Kalinin on 12/25/18.
//

#import <UIKit/UIKit.h>
#import "UIViewController.h"
#import "UITableView.h"

@class UITableViewControllerOperation;

@protocol UITableViewControllerOperationDelegate;










@protocol UITableViewControllerOperationDelegate <UIViewControllerOperationDelegate>

@end



@interface UITableViewControllerOperation : UIViewControllerOperation <UITableViewControllerOperationDelegate>

@property (weak, readonly) UITableViewController *object;

@end










@interface UITableViewController (UIE) <UITableViewOperationDelegate>

@property (readonly) UITableViewControllerOperation *operation;

@end
