//
//  UIETabBar.h
//  Controls
//
//  Created by Dan Kalinin on 12/17/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class UIETabBar;
@class UIETabBarOperation;










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
