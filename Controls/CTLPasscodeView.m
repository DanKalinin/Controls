//
//  CTLPasscodeView.m
//  Controls
//
//  Created by Dan Kalinin on 8/10/18.
//

#import "CTLPasscodeView.h"



@interface CTLPasscodeView ()

@property NSMutableString *passcode;

@end



@implementation CTLPasscodeView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.passcode = NSMutableString.string;
    
    for (CTLButton *button in self.buttons) {
        [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self.buttonDelete addTarget:self action:@selector(buttonDelete:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Interface

- (void)resetWithError:(NSError *)error {
    
}

#pragma mark - Actions

- (void)button:(CTLButton *)sender {
    if (self.passcode.length < self.labels.count) {
        CTLLabel *label = self.labels[self.passcode.length];
        label.text = sender.stringTag;
        label.highlighted = YES;
        
        [self.passcode appendString:sender.stringTag];
        
        self.buttonDelete.enabled = YES;
        
        [self sendActionsForControlEvents:UIControlEventEditingChanged];
        if (self.passcode.length == self.labels.count) {
            [self sendActionsForControlEvents:UIControlEventEditingDidEnd];
        }
    }
}

- (void)buttonDelete:(CTLButton *)sender {
    if (self.passcode.length > 0) {
        NSRange range = NSMakeRange(self.passcode.length - 1, 1);
        [self.passcode deleteCharactersInRange:range];
        
        CTLLabel *label = self.labels[self.passcode.length];
        label.text = @"";
        label.highlighted = NO;
        
        self.buttonDelete.enabled = (self.passcode.length > 0);
        
        [self sendActionsForControlEvents:UIControlEventEditingChanged];
    }
}

@end
