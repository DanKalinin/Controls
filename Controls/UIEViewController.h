//
//  UIEViewController.h
//  Controls
//
//  Created by Dan Kalinin on 12/20/18.
//

#import <UIKit/UIKit.h>
#import "UIViewController.h"
#import "UIEView.h"

@class UIEViewController;
@class UIEViewControllerOperation;

@protocol UIEViewControllerOperationDelegate;










@interface UIEViewController : UIViewController

@property (nonatomic) UIEView *view;

@property (readonly) Class operationClass;
@property (readonly) UIEViewControllerOperation *operation;

@end










@protocol UIEViewControllerOperationDelegate <UIViewControllerOperationDelegate>

@end



@interface UIEViewControllerOperation : UIViewControllerOperation <UIEViewControllerOperationDelegate>

@property (weak, readonly) UIEViewController *weakObject;

@end
