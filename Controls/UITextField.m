//
//  UITextField.m
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import "UITextField.h"










@interface UITextFieldOperation ()

@end



@implementation UITextFieldOperation

@dynamic delegates;
@dynamic object;

- (instancetype)initWithObject:(UITextField *)object {
    self = [super initWithObject:object];
    if (self) {
        self.object.delegate = self.delegates;
        
        [self.object addTarget:self.delegates action:@selector(uiTextFieldEditingDidBegin:event:) forControlEvents:UIControlEventEditingDidBegin];
        [self.object addTarget:self.delegates action:@selector(uiTextFieldEditingChanged:event:) forControlEvents:UIControlEventEditingChanged];
        [self.object addTarget:self.delegates action:@selector(uiTextFieldEditingDidEnd:event:) forControlEvents:UIControlEventEditingDidEnd];
        [self.object addTarget:self.delegates action:@selector(uiTextFieldEditingDidEndOnExit:event:) forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    return self;
}

#pragma mark - Text field

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (self.object.uieClearOnBegin) {
        self.object.text = @"";
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (self.object.uiePattern.length > 0) {
        NSString *text = [self.object.text stringByReplacingCharactersInRange:range withString:string];
        NSRange range = [text rangeOfString:self.object.uiePattern options:NSRegularExpressionSearch];
        if (range.location == NSNotFound) {
            return NO;
        } else {
            return YES;
        }
    } else {
        return YES;
    }
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
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
