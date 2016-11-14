//
//  UnderscoredButtonsView.m
//  Framework
//
//  Created by Dan Kalinin on 14/11/16.
//  Copyright © 2016 Dan Kalinin. All rights reserved.
//

#import "UnderscoredButtonsControl.h"



@interface UnderscoredButtonsControl ()

@property UIButton *selectedButton;

@end



@implementation UnderscoredButtonsControl

- (void)setButtons:(NSArray *)buttons {
    _buttons = buttons;
    
    for (UIView *view in self.stackView.arrangedSubviews) {
        [self.stackView removeArrangedSubview:view];
        [view removeFromSuperview];
    }
    
    for (UIButton *button in buttons) {
        [self.stackView addArrangedSubview:button];
        [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self.stackView layoutIfNeeded];
    [self selectButton:buttons.firstObject animated:NO];
}

- (void)selectButton:(UIButton *)button animated:(BOOL)animated {
    self.selectedButton = button;
    
    [self.buttons setValue:@NO forKey:@"selected"];
    button.selected = YES;
    
    self.leadingConstraint.constant = button.frame.origin.x;
    self.widthConstraint.constant = button.frame.size.width;
    NSTimeInterval duration = self.duration * animated;
    [UIView animateWithDuration:duration animations:^{
        [self.underscoreView.superview layoutIfNeeded];
    }];
}

#pragma mark - Actions

- (void)onClick:(UIButton *)sender {
    
    if ([sender isEqual:self.selectedButton]) return;
    
    [self selectButton:sender animated:YES];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

@end
