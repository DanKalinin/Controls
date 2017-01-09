//
//  OnboardingPVC.h
//  SmartHome
//
//  Created by Dan Kalinin on 1/13/17.
//  Copyright © 2017 Dan Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface PageVC : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (readonly) UIPageViewController *pageViewController;
@property (readonly) NSArray *pages;
@property (readonly) UIViewController *page;
@property IBInspectable BOOL recursive;

@end
