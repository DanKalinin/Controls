//
//  UIENavigationController.m
//  Controls
//
//  Created by Dan Kalinin on 12/8/18.
//

#import "UIENavigation.h"










@interface UIENavigationBar ()

@property UIENavigationBarOperation *operation;

@end



@implementation UIENavigationBar

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.operation = [self.operationClass.alloc initWithNavigationBar:self];
    }
    return self;
}

- (Class)operationClass {
    return UIENavigationBarOperation.class;
}

@end










@interface UIENavigationBarOperation ()

@property (weak) UIENavigationBar *navigationBar;

@end



@implementation UIENavigationBarOperation

@dynamic delegates;

- (instancetype)initWithNavigationBar:(UIENavigationBar *)navigationBar {
    self = super.init;
    if (self) {
        self.navigationBar = navigationBar;
        self.navigationBar.delegate = self.delegates;
    }
    return self;
}

@end










@interface UIENavigationController ()

@property UIENavigationControllerOperation *operation;

@end



@implementation UIENavigationController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.operation = [self.operationClass.alloc initWithViewController:self];
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

- (instancetype)initWithViewController:(UIENavigationController *)controller {
    self = [super initWithViewController:controller];
    if (self) {
        self.controller.delegate = self.delegates;
    }
    return self;
}

@end
