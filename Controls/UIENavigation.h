//
//  UIENavigationController.h
//  Controls
//
//  Created by Dan Kalinin on 12/8/18.
//

#import <UIKit/UIKit.h>
#import "UIEController.h"

@class UIENavigationController;
@class UIENavigationControllerOperation;










@interface UIENavigationController : UINavigationController

@property (readonly) Class operationClass;
@property (readonly) UIENavigationControllerOperation *operation;

@end










@protocol UIENavigationControllerOperationDelegate <UIEControllerOperationDelegate, UINavigationControllerDelegate>

@end



@interface UIENavigationControllerOperation : UIEControllerOperation <UIENavigationControllerOperationDelegate>

@property (readonly) HLPArray<UIENavigationControllerOperationDelegate> *delegates;

@property (weak, readonly) UIENavigationController *controller;

@end
