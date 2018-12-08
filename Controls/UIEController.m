//
//  UIEController.m
//  Controls
//
//  Created by Dan Kalinin on 12/8/18.
//

#import "UIEController.h"










@interface UIEControllerOperationPrepareForSegueInfo ()

@property UIStoryboardSegue *segue;
@property id sender;

@end



@implementation UIEControllerOperationPrepareForSegueInfo

- (instancetype)initWithSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self = super.init;
    if (self) {
        self.segue = segue;
        self.sender = sender;
    }
    return self;
}

@end










@interface UIEControllerOperation ()

@property (weak) UIViewController *controller;

@end



@implementation UIEControllerOperation

@dynamic delegates;

- (instancetype)initWithController:(UIViewController *)controller {
    self = super.init;
    if (self) {
        self.controller = controller;
        self.controller.transitioningDelegate = self.delegates;
    }
    return self;
}

@end
