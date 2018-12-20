//
//  UIETabBar.h
//  Controls
//
//  Created by Dan Kalinin on 12/17/18.
//

#import <UIKit/UIKit.h>
#import "UIViewController.h"

@class UIETabBar;
@class UIETabBarOperation;
@class UIETabBarController;
@class UIETabBarControllerOperation;










@interface UIETabBar : UITabBar

@property (readonly) Class operationClass;
@property (readonly) UIETabBarOperation *operation;

@end










@protocol UIETabBarOperationDelegate <NSEOperationDelegate, UITabBarDelegate>

@end



@interface UIETabBarOperation : NSEOperation <UIETabBarOperationDelegate>

@property (readonly) HLPArray<UIETabBarOperationDelegate> *delegates;

@property (weak, readonly) UIETabBar *tabBar;

- (instancetype)initWithTabBar:(UIETabBar *)tabBar;

@end










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










@interface UIStoryboardSegue (UIETabBar)

@property (readonly) UIETabBarController *destinationTabBarController;

@end
