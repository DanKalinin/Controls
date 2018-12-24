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
@dynamic weakObject;

- (instancetype)initWithWeakObject:(UITextField *)weakObject {
    self = [super initWithWeakObject:weakObject];
    if (self) {
        self.weakObject.delegate = self.delegates;
    }
    return self;
}

#pragma mark - Text field

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.delegates UITextFieldOperationDidBeginEditing:self];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    self.shouldChangeInfo = [UITextFieldOperationShouldChangeInfo.alloc initWithRange:range string:string];
    [self.delegates UITextFieldOperationShouldChange:self];
    return self.shouldChangeInfo.shouldChange;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    self.shouldReturnInfo = UITextFieldOperationShouldReturnInfo.new;
    [self.delegates UITextFieldOperationShouldReturn:self];
    return self.shouldReturnInfo.shouldReturn;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
}

#pragma mark - Control operation

- (void)UIControlOperationEventEditingDidBegin:(UITextFieldOperation *)operation {
    [super UIControlOperationEventEditingDidBegin:self];
    
    [self.delegates UITextFieldOperationEventEditingDidBegin:self];
}

- (void)UIControlOperationEventEditingChanged:(UITextFieldOperation *)operation {
    [super UIControlOperationEventEditingChanged:self];
    
    [self.delegates UITextFieldOperationEventEditingChanged:self];
}

- (void)UIControlOperationEventEditingDidEnd:(UITextFieldOperation *)operation {
    [super UIControlOperationEventEditingDidEnd:self];
    
    [self.delegates UITextFieldOperationEventEditingDidEnd:self];
}

- (void)UIControlOperationEventEditingDidEndOnExit:(UITextFieldOperation *)operation {
    [super UIControlOperationEventEditingDidEndOnExit:self];
    
    [self.delegates UITextFieldOperationEventEditingDidEndOnExit:self];
}

#pragma mark - Text field operation

- (void)UITextFieldOperationEventEditingDidBegin:(UIControlOperation *)operation {
    
}

- (void)UITextFieldOperationEventEditingChanged:(UIControlOperation *)operation {
    
}

- (void)UITextFieldOperationEventEditingDidEnd:(UITextFieldOperation *)operation {
    
}

- (void)UITextFieldOperationEventEditingDidEndOnExit:(UITextFieldOperation *)operation {
    
}

- (void)UITextFieldOperationDidBeginEditing:(UITextFieldOperation *)operation {
    if (self.weakObject.clearOnBegin) {
        self.weakObject.text = @"";
    }
}

- (void)UITextFieldOperationShouldChange:(UITextFieldOperation *)operation {
    if (self.weakObject.pattern.length > 0) {
        NSString *text = [self.weakObject.text stringByReplacingCharactersInRange:self.shouldChangeInfo.range withString:self.shouldChangeInfo.string];
        NSRange range = [text rangeOfString:self.weakObject.pattern options:NSRegularExpressionSearch];
        if (range.location == NSNotFound) {
            self.shouldChangeInfo.shouldChange = NO;
        } else {
            self.shouldChangeInfo.shouldChange = YES;
        }
    } else {
        self.shouldChangeInfo.shouldChange = YES;
    }
}

- (void)UITextFieldOperationShouldReturn:(UITextFieldOperation *)operation {
    
}

@end










@implementation UITextField (UIE)

@dynamic clearOnBegin;
@dynamic pattern;

@end
