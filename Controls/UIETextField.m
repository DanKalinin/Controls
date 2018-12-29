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
        
        [object addTarget:self.delegates action:@selector(uieTextFieldEditingDidBegin:event:) forControlEvents:UIControlEventEditingDidBegin];
        [object addTarget:self.delegates action:@selector(uieTextFieldEditingChanged:event:) forControlEvents:UIControlEventEditingChanged];
        [object addTarget:self.delegates action:@selector(uieTextFieldEditingDidEnd:event:) forControlEvents:UIControlEventEditingDidEnd];
        [object addTarget:self.delegates action:@selector(uieTextFieldEditingDidEndOnExit:event:) forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    return self;
}

#pragma mark - Text field

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (self.clearOnBegin) {
        textField.text = @"";
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (self.pattern.length > 0) {
        NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];
        NSRange range = [text rangeOfString:self.pattern options:NSRegularExpressionSearch];
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

- (Class)nseOperationClass {
    return UIETextFieldOperation.class;
}

@end










@interface UIETextField ()

@end



@implementation UIETextField

@end
