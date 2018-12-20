//
//  UIEStoryboardSegue.h
//  Controls
//
//  Created by Dan Kalinin on 12/20/18.
//

#import <UIKit/UIKit.h>

#import "UIENavigationController.h"

@class UIEStoryboardSegue;



@interface UIEStoryboardSegue : UIStoryboardSegue

@property (readonly) UIENavigationController *destinationNavigationController;

@end
