//
//  UIETabBar.m
//  Controls
//
//  Created by Dan Kalinin on 12/17/18.
//

#import "UIETabBar.h"










@interface UIETabBar ()

@property UIETabBarOperation *operation;

@end



@implementation UIETabBar

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.operation = [self.operationClass.alloc initWithTabBar:self];
    }
    return self;
}

- (Class)operationClass {
    return UIETabBarOperation.class;
}

@end










@interface UIETabBarOperation ()

@property (weak) UIETabBar *tabBar;

@end



@implementation UIETabBarOperation

@dynamic delegates;

- (instancetype)initWithTabBar:(UIETabBar *)tabBar {
    self = super.init;
    if (self) {
        self.tabBar = tabBar;
        self.tabBar.delegate = self.delegates;
    }
    return self;
}

@end










@interface UIETabBarController ()

@end



@implementation UIETabBarController

@end










@interface UIETabBarControllerOperation ()

@end



@implementation UIETabBarControllerOperation

@dynamic delegates;
@dynamic viewController;

- (instancetype)initWithViewController:(UIETabBarController *)viewController {
    self = [super initWithViewController:viewController];
    if (self) {
        self.viewController.delegate = self.delegates;
    }
    return self;
}

@end










@implementation UIStoryboardSegue (UIETabBar)

- (UIETabBarController *)destinationTabBarController {
    return self.destinationViewController;
}

@end
