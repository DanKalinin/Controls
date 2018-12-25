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
        self.operation = [self.operationClass.alloc initWithWeakObject:self];
    }
    return self;
}

- (Class)operationClass {
    return UIEApplicationOperation.class;
}

@end










@interface UIEApplicationOperation ()

@end



@implementation UIEApplicationOperation

@dynamic delegates;

@end
