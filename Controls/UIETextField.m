//
//  UIETextField.m
//  Controls
//
//  Created by Dan Kalinin on 11/28/18.
//

#import "UIETextField.h"










@interface UIETextField ()

@property UIETextFieldOperation *operation;

@end



@implementation UIETextField

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.operation = [self.operationClass.alloc initWithWeakObject:self];
    }
    return self;
}

- (Class)operationClass {
    return UIETextFieldOperation.class;
}

@end










@interface UIETextFieldOperation ()

@end



@implementation UIETextFieldOperation

@dynamic delegates;
@dynamic weakObject;

@end
