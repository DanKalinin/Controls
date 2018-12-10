//
//  UIEStoryboard.m
//  Controls
//
//  Created by Dan Kalinin on 12/11/18.
//

#import "UIEStoryboard.h"



@interface UIEStoryboardSegue ()

@end



@implementation UIEStoryboardSegue

- (UIENavigationController *)destinationNavigationViewController {
    return self.destinationViewController;
}

@end
