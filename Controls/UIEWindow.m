//
//  UIEWindow.m
//  Controls
//
//  Created by Dan Kalinin on 12/21/18.
//

#import "UIEWindow.h"










@interface UIEWindow ()

@property UIEWindowOperation *operation;

@end



@implementation UIEWindow

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.operation = [self.operationClass.alloc initWithWeakObject:self];
    }
    return self;
}

- (Class)operationClass {
    return UIEWindowOperation.class;
}

@end










@interface UIEWindowOperation ()

@end



@implementation UIEWindowOperation

@dynamic delegates;
@dynamic weakObject;

@end
