//
//  UITextField.m
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import "UIETextField.h"










@interface UIETextFieldOperation ()

@end



@implementation UIETextFieldOperation

@dynamic delegates;
@dynamic object;

- (instancetype)initWithObject:(UITextField *)object {
    self = [super initWithObject:object];
    if (self) {
        object.delegate = self.delegates;
        
        [object addTarget:self.delegates action:@selector(uiTextFieldEditingDidBegin:event:) forControlEvents:UIControlEventEditingDidBegin];
        [object addTarget:self.delegates action:@selector(uiTextFieldEditingChanged:event:) forControlEvents:UIControlEventEditingChanged];
        [object addTarget:self.delegates action:@selector(uiTextFieldEditingDidEnd:event:) forControlEvents:UIControlEventEditingDidEnd];
        [object addTarget:self.delegates action:@selector(uiTextFieldEditingDidEndOnExit:event:) forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    return self;
}

#pragma mark - Text field

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField.uieClearOnBegin) {
        textField.text = @"";
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField.uiePattern.length > 0) {
        NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];
        NSRange range = [text rangeOfString:textField.uiePattern options:NSRegularExpressionSearch];
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
    return UIETextFieldOperation.class;
}

@end










@interface UIETextField ()

@end



@implementation UIETextField

@end
