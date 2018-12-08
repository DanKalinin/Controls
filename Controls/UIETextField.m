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










@interface UIETextFieldOperationShouldChangeCharactersInfo ()

@property NSRange range;
@property NSString *string;

@end



@implementation UIETextFieldOperationShouldChangeCharactersInfo

- (instancetype)initWithRange:(NSRange)range string:(NSString *)string {
    self = super.init;
    if (self) {
        self.range = range;
        self.string = string;
        
        self.shouldChange = YES;
    }
    return self;
}

@end










@interface UIETextFieldOperationShouldReturnInfo ()

@end



@implementation UIETextFieldOperationShouldReturnInfo

- (instancetype)init {
    self = super.init;
    if (self) {
        self.shouldReturn = YES;
    }
    return self;
}

@end










@interface UIETextFieldOperation ()

@property UIETextFieldOperationShouldReturnInfo *shouldReturnInfo;
@property UIETextFieldOperationShouldChangeCharactersInfo *shouldChangeCharactersInfo;

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

#pragma mark - Text field

- (BOOL)textFieldShouldBeginEditing:(UIETextField *)textField {
    return YES;
}

- (void)textFieldDidBeginEditing:(UIETextField *)textField {
    if (self.textField.clearOnBegin) {
        self.textField.text = @"";
    }
}

- (BOOL)textField:(UIETextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    self.shouldChangeCharactersInfo = [UIETextFieldOperationShouldChangeCharactersInfo.alloc initWithRange:range string:string];
    
    if (self.textField.pattern.length > 0) {
        NSString *text = [self.textField.text stringByReplacingCharactersInRange:self.shouldChangeCharactersInfo.range withString:self.shouldChangeCharactersInfo.string];
        NSRange range = [text rangeOfString:self.textField.pattern options:NSRegularExpressionSearch];
        if (range.location == NSNotFound) {
            self.shouldChangeCharactersInfo.shouldChange = NO;
        } else {
            self.shouldChangeCharactersInfo.shouldChange = YES;
        }
    } else {
        self.shouldChangeCharactersInfo.shouldChange = YES;
    }
    
    [self.delegates UIETextFieldOperationShouldChangeCharacters:self];
    return self.shouldChangeCharactersInfo.shouldChange;
}

- (BOOL)textFieldShouldClear:(UIETextField *)textField {
    return YES;
}

- (BOOL)textFieldShouldReturn:(UIETextField *)textField {
    self.shouldReturnInfo = UIETextFieldOperationShouldReturnInfo.new;
    [self.delegates UIETextFieldOperationShouldReturn:self];
    return self.shouldReturnInfo.shouldReturn;
}

- (BOOL)textFieldShouldEndEditing:(UIETextField *)textField {
    return YES;
}

- (void)textFieldDidEndEditing:(UIETextField *)textField {
    
}

@end
