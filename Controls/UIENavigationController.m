//
//  UIENavigationController.m
//  Controls
//
//  Created by Dan Kalinin on 12/20/18.
//

#import "UIENavigationController.h"










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
@dynamic viewController;

- (instancetype)initWithViewController:(UIENavigationController *)viewController {
    self = [super initWithViewController:viewController];
    if (self) {
        self.viewController.delegate = self.delegates;
    }
    return self;
}

@end
