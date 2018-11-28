//
//  UIEApplication.m
//  Controls
//
//  Created by Dan Kalinin on 10/31/18.
//

#import "UIEApplication.h"










@interface UIEApplication ()

@property UIEApplicationOperation *operation;

@end



@implementation UIEApplication

- (instancetype)init {
    self = super.init;
    if (self) {
        self.operation = [self.operationClass.alloc initWithApplication:self];
    }
    return self;
}

- (Class)operationClass {
    return UIEApplicationOperation.class;
}

@end










@interface UIEApplicationOperation ()

@property (weak) UIEApplication *application;

@end



@implementation UIEApplicationOperation

@dynamic delegates;

- (instancetype)initWithApplication:(UIEApplication *)application {
    self = super.init;
    if (self) {
        self.application = application;
        self.application.delegate = self.delegates;
    }
    return self;
}

@end
