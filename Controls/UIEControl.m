//
//  UIEControl.m
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import "UIEControl.h"










@interface UIEControl ()

@property UIEControlOperation *operation;

@end



@implementation UIEControl

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.operation = [self.operationClass.alloc initWithWeakObject:self];
    }
    return self;
}

- (Class)operationClass {
    return UIEControlOperation.class;
}

@end










@interface UIEControlOperation ()

@end



@implementation UIEControlOperation

@dynamic weakObject;

@end
