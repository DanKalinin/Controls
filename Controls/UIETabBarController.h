//
//  UIETabBarController.h
//  Controls
//
//  Created by Dan Kalinin on 12/20/18.
//

#import <UIKit/UIKit.h>
#import "UIViewController.h"

@class UIETabBarController;
@class UIETabBarControllerOperation;

@protocol UIETabBarControllerOperationDelegate;










@interface UIETabBarController : UITabBarController

@property (readonly) Class operationClass;
@property (readonly) UIETabBarControllerOperation *operation;

@end










@protocol UIETabBarControllerOperationDelegate <UIViewControllerOperationDelegate, UITabBarControllerDelegate>

@end



@interface UIETabBarControllerOperation : UIViewControllerOperation

@property (readonly) HLPArray<UIETabBarControllerOperationDelegate> *delegates;

@property (weak, readonly) UIETabBarController *viewController;

@end
