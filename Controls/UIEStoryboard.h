//
//  UIEStoryboard.h
//  Controls
//
//  Created by Dan Kalinin on 12/11/18.
//

#import <UIKit/UIKit.h>
#import "UIENavigation.h"



@interface UIEStoryboardSegue : UIStoryboardSegue

@property (readonly) UIENavigationController *destinationNavigationViewController;

@end
