//
//  OnboardingPVC.m
//  SmartHome
//
//  Created by Dan Kalinin on 1/13/17.
//  Copyright © 2017 Dan Kalinin. All rights reserved.
//

#import "PageVC.h"

static NSString *const PageSegue = @"Page";



@interface PageVC ()

@property UIPageViewController *pageViewController;
@property UIPageControl *pageControl;
@property NSArray *pages;
@property UIViewController *page;

@end



@implementation PageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self != %@", self.pageViewController];
    self.pages = [self.childViewControllers filteredArrayUsingPredicate:predicate];
    
    self.page = self.pages[self.index];
    [self.pageViewController setViewControllers:@[self.page] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    self.pageControl = [self.pageViewController valueForKey:@"pageControl"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:PageSegue]) {
        self.pageViewController = segue.destinationViewController;
        self.pageViewController.dataSource = self;
        self.pageViewController.delegate = self;
    }
}

#pragma mark - Page view controller

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = [self.pages indexOfObject:viewController];
    UIViewController *vc;
    if (index > 0) {
        index--;
        vc = self.pages[index];
    } else {
        if (self.recursive) {
            index = self.pages.count - 1;
            vc = self.pages[index];
        } else {
            vc = nil;
        }
    }
    return vc;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = [self.pages indexOfObject:viewController];
    UIViewController *vc;
    if (index < self.pages.count - 1) {
        index++;
        vc = self.pages[index];
    } else {
        if (self.recursive) {
            index = 0;
            vc = self.pages[index];
        } else {
            vc = nil;
        }
    }
    return vc;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return self.pages.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return self.index;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    self.page = pageViewController.viewControllers.firstObject;
    self.index = self.pageControl.currentPage;
}

@end
