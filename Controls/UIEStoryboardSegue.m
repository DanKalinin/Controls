//
//  UIEStoryboardSegue.m
//  Controls
//
//  Created by Dan Kalinin on 12/20/18.
//

#import "UIEStoryboardSegue.h"



@interface UIEStoryboardSegue ()

@end



@implementation UIEStoryboardSegue

- (UIENavigationController *)destinationNavigationController {
    return self.destinationViewController;
}

@end
