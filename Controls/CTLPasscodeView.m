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

#pragma mark - Actions

- (void)button:(CTLButton *)sender {
    if (self.passcode.length < self.labels.count) {
        self.labels[self.passcode.length].highlighted = YES;
        [self.passcode appendString:sender.stringTag];
        
        self.buttonDelete.enabled = YES;
    }
}

- (void)buttonDelete:(CTLButton *)sender {
    if (self.passcode.length > 0) {
        NSRange range = NSMakeRange(self.passcode.length - 1, 1);
        [self.passcode deleteCharactersInRange:range];
        self.labels[self.passcode.length].highlighted = NO;
        
        self.buttonDelete.enabled = (self.passcode.length > 0);
    }
}

@end
