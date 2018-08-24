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
}

#pragma mark - Actions

- (void)button:(CTLButton *)button {
    [self.passcode appendString:button.stringTag];
    
    if (self.passcode.length == self.labels.count) {
        NSLog(@"filled");
    }
}

@end
