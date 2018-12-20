//
//  UIENavigationController.h
//  Controls
//
//  Created by Dan Kalinin on 12/20/18.
//

#import <UIKit/UIKit.h>
#import "UIViewController.h"

@class UIENavigationController;
@class UIENavigationControllerOperation;

@protocol UIENavigationControllerOperationDelegate;










@interface UIENavigationController : UINavigationController

@property (readonly) Class operationClass;
@property (readonly) UIENavigationControllerOperation *operation;

@end










@protocol UIENavigationControllerOperationDelegate <UIViewControllerOperationDelegate, UINavigationControllerDelegate>

@end



@interface UIENavigationControllerOperation : UIViewControllerOperation <UIENavigationControllerOperationDelegate>

@property (readonly) HLPArray<UIENavigationControllerOperationDelegate> *delegates;

@property (weak, readonly) UIENavigationController *viewController;

@end
