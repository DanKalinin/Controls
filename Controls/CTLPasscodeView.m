//
//  CTLPasscodeView.m
//  Controls
//
//  Created by Dan Kalinin on 8/10/18.
//

#import "CTLPasscodeView.h"



@interface CTLPasscodeView ()

@property NSMutableString *passcode;
@property UINotificationFeedbackGenerator *notificationFeedbackGenerator;

@end



@implementation CTLPasscodeView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.passcode = NSMutableString.string;
    self.notificationFeedbackGenerator = UINotificationFeedbackGenerator.new;
    
    for (CTLButton *button in self.buttons) {
        [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self.buttonDelete addTarget:self action:@selector(buttonDelete:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Interface

- (void)reset {
    [self.passcode setString:@""];
    
    for (CTLLabel *label in self.labels) {
        label.text = @"";
        label.highlighted = NO;
    }
    
    self.buttonDelete.enabled = NO;
}

- (void)resetWithError:(NSError *)error completion:(HLPVoidBlock)completion {
//    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.2 initialSpringVelocity:0.5 options:UIViewAnimationOptionAllowUserInteraction animations:^{
//        self.labels.firstObject.superview.transform = CGAffineTransformMakeTranslation(20.0, 0.0);
//    } completion:^(BOOL finished) {
//        self.labelError.text = error.localizedDescription;
//        [self reset];
//        [self invokeHandler:completion];
//    }];
}

//- (void)resetWithError:(NSError *)error {
//    [self.notificationFeedbackGenerator notificationOccurred:UINotificationFeedbackTypeError];
//    
//    [HLPClock.shared tickWithInterval:0.5 completion:^{
//        [self.passcode setString:@""];
//        
//        for (CTLLabel *label in self.labels) {
//            label.text = @"";
//            label.highlighted = NO;
//        }
//        
//        self.buttonDelete.enabled = NO;
//    }];
//}

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
            [self.notificationFeedbackGenerator prepare];
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
