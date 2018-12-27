//
//  UIStoryboardSegue.h
//  Controls
//
//  Created by Dan Kalinin on 12/27/18.
//

#import <UIKit/UIKit.h>



@interface UIStoryboardSegue (UIE)

@property (readonly) UINavigationController *destinationNavigationController;
@property (readonly) UITabBarController *destinationTabBarController;

@end
