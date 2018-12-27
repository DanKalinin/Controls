//
//  UIStoryboardSegue.m
//  Controls
//
//  Created by Dan Kalinin on 12/27/18.
//

#import "UIStoryboardSegue.h"



@implementation UIStoryboardSegue (UIE)

- (UINavigationController *)destinationNavigationController {
    return self.destinationViewController;
}

- (UITabBarController *)destinationTabBarController {
    return self.destinationViewController;
}

@end
