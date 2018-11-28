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
        self.operation = [self.operationClass.alloc initWithTextField:self];
    }
    return self;
}

- (Class)operationClass {
    return UIETextFieldOperation.class;
}

@end










@interface UIETextFieldOperation ()

@property (weak) UIETextField *textField;

@end



@implementation UIETextFieldOperation

@dynamic delegates;

- (instancetype)initWithTextField:(UIETextField *)textField {
    self = super.init;
    if (self) {
        self.textField = textField;
        self.textField.delegate = self.delegates;
    }
    return self;
}

@end
