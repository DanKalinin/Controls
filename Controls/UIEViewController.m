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










@interface UIEViewControllerPrepareForSegue ()

@property UIStoryboardSegue *segue;
@property id sender;

@end



@implementation UIEViewControllerPrepareForSegue

- (instancetype)initWithSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self = super.init;
    
    self.segue = segue;
    self.sender = sender;
    
    return self;
}

@end










@interface UIEViewControllerOperation () <UIViewControllerTransitioningDelegate>

@property UIEViewControllerPrepareForSegue *prepareForSegue;

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.prepareForSegue = [UIEViewControllerPrepareForSegue.alloc initWithSegue:segue sender:sender];
}

@end
