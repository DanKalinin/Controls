//
//  TextFields.m
//  Controls
//
//  Created by Dan Kalinin on 10/10/17.
//

#import "TextFields.h"



@interface TextFields ()

@property BOOL valid;

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

#pragma mark - Actions

- (void)editingChanged:(TextField *)sender {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"valid = YES"];
    NSArray *validTextFields = [self.textFields filteredArrayUsingPredicate:predicate];
    self.valid = (validTextFields.count == self.textFields.count);
    [self.buttons setValue:@(self.valid) forKey:@"enabled"];
    
    [self sendActionsForControlEvents:UIControlEventEditingChanged];
}

@end