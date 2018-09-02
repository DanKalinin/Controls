//
//  CTLTextField.m
//  Controls
//
//  Created by Dan Kalinin on 9/1/18.
//

#import "CTLTextField.h"










@interface CTLTextField ()

@property HLPArray<CTLTextFieldDelegate> *delegates;
@property CTLTextFieldManager *manager;

@end



@implementation CTLTextField

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.manager = CTLTextFieldManager.new;
        
        self.delegates = (id)HLPArray.weakArray;
        self.delegates.operationQueue = NSOperationQueue.mainQueue;
        [self.delegates addObject:self.manager];
        
        self.delegate = self.delegates;
    }
    return self;
}

@end










@interface CTLTextFieldManager ()

@end



@implementation CTLTextFieldManager

#pragma mark - Text field

- (BOOL)textFieldShouldBeginEditing:(CTLTextField *)textField {
    return YES;
}

- (void)textFieldDidBeginEditing:(CTLTextField *)textField {
    
}

- (BOOL)textField:(CTLTextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField.editingChangedPattern.length > 0) {
        NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];
        NSRange range = [text rangeOfString:textField.editingChangedPattern options:NSRegularExpressionSearch];
        if (range.location == NSNotFound) {
            return NO;
        } else {
            return YES;
        }
    } else {
        return YES;
    }
}

- (BOOL)textFieldShouldClear:(CTLTextField *)textField {
    return YES;
}

- (BOOL)textFieldShouldReturn:(CTLTextField *)textField {
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(CTLTextField *)textField {
    if (textField.editingDidEndPattern.length > 0) {
        NSRange range = [textField.text rangeOfString:textField.editingDidEndPattern options:NSRegularExpressionSearch];
        if (range.location == NSNotFound) {
            return NO;
        } else {
            return YES;
        }
    } else {
        return YES;
    }
}

- (void)textFieldDidEndEditing:(CTLTextField *)textField {
    
}

@end
