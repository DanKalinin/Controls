//
//  UITextField.m
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import "UITextField.h"










@interface UITextFieldOperationShouldChangeInfo ()

@property NSRange range;
@property NSString *string;

@end



@implementation UITextFieldOperationShouldChangeInfo

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










@interface UITextFieldOperationShouldReturnInfo ()

@end



@implementation UITextFieldOperationShouldReturnInfo

- (instancetype)init {
    self = super.init;
    if (self) {
        self.shouldReturn = YES;
    }
    return self;
}

@end










@interface UITextFieldOperation ()

@property UITextFieldOperationShouldChangeInfo *shouldChangeInfo;
@property UITextFieldOperationShouldReturnInfo *shouldReturnInfo;

@end



@implementation UITextFieldOperation

@dynamic delegates;
@dynamic object;

- (instancetype)initWithObject:(UITextField *)object {
    self = [super initWithObject:object];
    if (self) {
        self.object.delegate = self.delegates;
    }
    return self;
}

#pragma mark - Control

- (void)uiControlOperationEventEditingDidBegin:(UITextFieldOperation *)operation {
    [super uiControlOperationEventEditingDidBegin:self];
    
    [self.delegates uiTextFieldOperationEventEditingDidBegin:self];
}

- (void)uiControlOperationEventEditingChanged:(UITextFieldOperation *)operation {
    [super uiControlOperationEventEditingChanged:self];
    
    [self.delegates uiTextFieldOperationEventEditingChanged:self];
}

- (void)uiControlOperationEventEditingDidEnd:(UITextFieldOperation *)operation {
    [super uiControlOperationEventEditingDidEnd:self];
    
    [self.delegates uiTextFieldOperationEventEditingDidEnd:self];
}

- (void)uiControlOperationEventEditingDidEndOnExit:(UITextFieldOperation *)operation {
    [super uiControlOperationEventEditingDidEndOnExit:self];
    
    [self.delegates uiTextFieldOperationEventEditingDidEndOnExit:self];
}

#pragma mark - Text field

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.delegates uiTextFieldOperationDidBeginEditing:self];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    self.shouldChangeInfo = [UITextFieldOperationShouldChangeInfo.alloc initWithRange:range string:string];
    [self.delegates uiTextFieldOperationShouldChange:self];
    return self.shouldChangeInfo.shouldChange;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    self.shouldReturnInfo = UITextFieldOperationShouldReturnInfo.new;
    [self.delegates uiTextFieldOperationShouldReturn:self];
    return self.shouldReturnInfo.shouldReturn;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
}

- (void)uiTextFieldOperationEventEditingDidBegin:(UITextFieldOperation *)operation {
    
}

- (void)uiTextFieldOperationEventEditingChanged:(UITextFieldOperation *)operation {
    
}

- (void)uiTextFieldOperationEventEditingDidEnd:(UITextFieldOperation *)operation {
    
}

- (void)uiTextFieldOperationEventEditingDidEndOnExit:(UITextFieldOperation *)operation {
    
}

- (void)uiTextFieldOperationDidBeginEditing:(UITextFieldOperation *)operation {
    if (self.object.uieClearOnBegin) {
        self.object.text = @"";
    }
}

- (void)uiTextFieldOperationShouldChange:(UITextFieldOperation *)operation {
    if (self.object.uiePattern.length > 0) {
        NSString *text = [self.object.text stringByReplacingCharactersInRange:self.shouldChangeInfo.range withString:self.shouldChangeInfo.string];
        NSRange range = [text rangeOfString:self.object.uiePattern options:NSRegularExpressionSearch];
        if (range.location == NSNotFound) {
            self.shouldChangeInfo.shouldChange = NO;
        } else {
            self.shouldChangeInfo.shouldChange = YES;
        }
    } else {
        self.shouldChangeInfo.shouldChange = YES;
    }
}

- (void)uiTextFieldOperationShouldReturn:(UITextFieldOperation *)operation {
    
}

@end










@implementation UITextField (UIE)

@dynamic nseOperation;
@dynamic uieClearOnBegin;
@dynamic uiePattern;

- (Class)nseOperationClass {
    return UITextFieldOperation.class;
}

@end
