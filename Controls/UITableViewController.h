//
//  UITableViewController.h
//  Controls
//
//  Created by Dan Kalinin on 12/25/18.
//

#import <UIKit/UIKit.h>
#import "UIViewController.h"

@class UITableViewControllerOperation;

@protocol UITableViewControllerOperationDelegate;










@protocol UITableViewControllerOperationDelegate <UIViewControllerOperationDelegate>

@end



@interface UITableViewControllerOperation : UIViewControllerOperation <UITableViewControllerOperationDelegate>

@end










@interface UITableViewController (UIE)

@end
