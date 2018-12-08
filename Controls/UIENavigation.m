//
//  UIENavigationController.m
//  Controls
//
//  Created by Dan Kalinin on 12/8/18.
//

#import "UIENavigation.h"










@interface UIENavigationController ()

@property UIENavigationControllerOperation *operation;

@end



@implementation UIENavigationController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.operation = [self.operationClass.alloc initWithController:self];
    }
    return self;
}

- (Class)operationClass {
    return UIENavigationControllerOperation.class;
}

@end










@interface UIENavigationControllerOperation ()

@end



@implementation UIENavigationControllerOperation

@dynamic delegates;
@dynamic controller;

- (instancetype)initWithController:(UIENavigationController *)controller {
    self = [super initWithController:controller];
    if (self) {
        self.controller.delegate = self.delegates;
    }
    return self;
}

@end
