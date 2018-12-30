//
//  UIEViewController.m
//  Controls
//
//  Created by Dan Kalinin on 12/30/18.
//

#import "UIEViewController.h"










@implementation UIViewController (UIE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return UIEViewControllerOperation.class;
}

@end










@interface UIEViewController ()

@end



@implementation UIEViewController

@end










@interface UIEViewControllerOperation () <UIViewControllerTransitioningDelegate>

@end



@implementation UIEViewControllerOperation

@dynamic object;

- (instancetype)initWithObject:(UIViewController *)object {
    self = [super initWithObject:object];
    
    object.transitioningDelegate = self;
    
    return self;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    
}

@end
