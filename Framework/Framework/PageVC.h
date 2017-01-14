//
//  OnboardingPVC.h
//  SmartHome
//
//  Created by Dan Kalinin on 1/13/17.
//  Copyright © 2017 Dan Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface PageVC : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (readonly) UIPageViewController *pageViewController;
@property (readonly) UIPageControl *pageControl;
@property (readonly) NSArray *pages;
@property (readonly) UIViewController *page;
@property IBInspectable NSUInteger index;
@property IBInspectable BOOL recursive;

@end
