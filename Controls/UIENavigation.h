//
//  UIENavigationController.h
//  Controls
//
//  Created by Dan Kalinin on 12/8/18.
//

#import <UIKit/UIKit.h>
#import "UIView.h"

@class UIENavigationBar;
@class UIENavigationBarOperation;
@class UIENavigationController;
@class UIENavigationControllerOperation;










@interface UIENavigationBar : UINavigationBar

@property (readonly) Class operationClass;
@property (readonly) UIENavigationBarOperation *operation;

@end










@protocol UIENavigationBarOperationDelegate <NSEOperationDelegate, UINavigationBarDelegate>

@end



@interface UIENavigationBarOperation : NSEOperation <UIENavigationBarOperationDelegate>

@property (readonly) HLPArray<UIENavigationBarOperationDelegate> *delegates;

@property (weak, readonly) UIENavigationBar *navigationBar;

- (instancetype)initWithNavigationBar:(UIENavigationBar *)navigationBar;

@end










@interface UIENavigationController : UINavigationController

@property (readonly) Class operationClass;
@property (readonly) UIENavigationControllerOperation *operation;

@end










@protocol UIENavigationControllerOperationDelegate <UIEControllerOperationDelegate, UINavigationControllerDelegate>

@end



@interface UIENavigationControllerOperation : UIViewControllerOperation <UIENavigationControllerOperationDelegate>

@property (readonly) HLPArray<UIENavigationControllerOperationDelegate> *delegates;

@property (weak, readonly) UIENavigationController *viewController;

@end
