//
//  TextFields.m
//  Controls
//
//  Created by Dan Kalinin on 10/10/17.
//

#import "TextFields.h"



@interface TextFields ()

@property BOOL valid;
@property NSString *text;

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

#pragma mark - Actions

- (void)editingChanged:(TextField *)sender {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"valid = YES"];
    NSArray *validTextFields = [self.textFields filteredArrayUsingPredicate:predicate];
    self.valid = (validTextFields.count == self.textFields.count);
    [self.buttons setValue:@(self.valid) forKey:@"enabled"];
    
    NSArray *components = [self.textFields valueForKey:@"text"];
    self.text = [components componentsJoinedByString:self.separator];
    
    [self sendActionsForControlEvents:UIControlEventEditingChanged];
}

@end
