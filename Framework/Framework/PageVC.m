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
@property NSArray *pages;
@property UIViewController *page;

@end



@implementation PageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self != %@", self.pageViewController];
    self.pages = [self.childViewControllers filteredArrayUsingPredicate:predicate];
    self.pageControl.numberOfPages = self.pages.count;
    
    UIViewController *page = self.pages[self.currentPage];
    [self setPage:page animated:NO];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    
    if ([segue.identifier isEqualToString:PageSegue]) {
        self.pageViewController = segue.destinationViewController;
        self.pageViewController.dataSource = self;
        self.pageViewController.delegate = self;
    }
}

- (void)setPage:(UIViewController *)page animated:(BOOL)animated {
    if (!page) return;
    if (![self.pages containsObject:page]) return;
    
    __weak typeof(self) this = self;
    [self.pageViewController setViewControllers:@[page] direction:UIPageViewControllerNavigationDirectionForward animated:animated completion:^(BOOL finished) {
        [this pageDidSet];
    }];
}

- (void)setNextPage:(BOOL)animated {
    UIViewController *page = [self pageViewController:self.pageViewController viewControllerAfterViewController:self.page];
    [self setPage:page animated:animated];
}

- (void)setPreviousPage:(BOOL)animated {
    UIViewController *page = [self pageViewController:self.pageViewController viewControllerBeforeViewController:self.page];
    [self setPage:page animated:animated];
}

- (void)pageDidSet {
    self.page = self.pageViewController.viewControllers.firstObject;
    self.pageControl.currentPage = [self.pages indexOfObject:self.page];
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

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    [self pageDidSet];
}

@end
