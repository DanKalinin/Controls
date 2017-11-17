//
//  TextFields.m
//  Controls
//
//  Created by Dan Kalinin on 10/10/17.
//

#import "TextFields.h"
#import <Helpers/Helpers.h>










@interface TextFields ()

@end



@implementation TextFields

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.separator = @".";
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    for (TextField *textField in self.textFields) {
        [textField addTarget:self action:@selector(editingChanged:) forControlEvents:UIControlEventEditingChanged];
    }
}

#pragma mark - Accessors

- (void)setText:(NSString *)text {
    NSArray *components = [text componentsSeparatedByString:self.separator];
    [self.textFields setValues:components forKey:@"text"];
}

- (NSString *)text {
    NSArray *components = [self.textFields valueForKey:@"text"];
    NSString *text = [components componentsJoinedByString:self.separator];
    return text;
}

- (BOOL)valid {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"valid = YES"];
    NSArray *validTextFields = [self.textFields filteredArrayUsingPredicate:predicate];
    BOOL valid = (validTextFields.count == self.textFields.count);
    return valid;
}

#pragma mark - Actions

- (void)editingChanged:(TextField *)sender {
    [self.buttons setValue:@(self.valid) forKey:@"enabled"];
    [self sendActionsForControlEvents:UIControlEventEditingChanged];
}

@end










@interface CodeTextFields ()

@end



@implementation CodeTextFields

#pragma mark - Actions

- (void)editingChanged:(TextField *)sender {
    [super editingChanged:sender];
    
    NSInteger offset = (sender.text.length == 1) ? 1 : -1;
    TextField *textField = [self.textFields objectWithOffset:offset fromObject:sender recursively:NO];
    if (textField) {
        [textField becomeFirstResponder];
    } else {
        [self endEditing:YES];
    }
}

@end
