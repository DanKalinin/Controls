//
//  UIETabBarController.m
//  Controls
//
//  Created by Dan Kalinin on 12/20/18.
//

#import "UIETabBarController.h"










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
