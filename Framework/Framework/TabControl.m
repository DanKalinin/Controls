//
//  UnderscoredButtonsView.m
//  Framework
//
//  Created by Dan Kalinin on 14/11/16.
//  Copyright © 2016 Dan Kalinin. All rights reserved.
//

#import "TabControl.h"



@interface TabControl ()

@property UIButton *button;

@end



@implementation TabControl

- (void)didMoveToWindow {
    [super didMoveToWindow];
    
    [self selectButton:self.buttons.firstObject animated:NO];
}

- (void)setButtons:(NSArray *)buttons {
    _buttons = buttons;
    
    self.button = buttons.firstObject;
    
    for (UIView *view in self.stackView.arrangedSubviews) {
        [self.stackView removeArrangedSubview:view];
        [view removeFromSuperview];
    }
    
    for (UIButton *button in buttons) {
        [self.stackView addArrangedSubview:button];
        [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self.stackView layoutIfNeeded];
}

- (void)selectButton:(UIButton *)button animated:(BOOL)animated {
    
    self.button.selected = NO;
    button.selected = YES;
    
    self.button = button;
    
    NSTimeInterval duration = 0.25 * animated;
    [self.underscoreView.superview layoutIfNeeded];
    [UIView animateWithDuration:duration animations:^{
        self.leadingConstraint.constant = button.frame.origin.x;
        self.widthConstraint.constant = button.frame.size.width;
        [self.underscoreView.superview layoutIfNeeded];
    }];
    
    CGFloat x = button.frame.origin.x - self.stackView.spacing;
    CGFloat width = button.frame.size.width + 2.0 * self.stackView.spacing;
    CGRect rect = CGRectMake(x, 0.0, width, 1.0);
    [self.scrollView scrollRectToVisible:rect animated:animated];
}

#pragma mark - Actions

- (void)onClick:(UIButton *)sender {
    
    if ([sender isEqual:self.button]) return;
    
    [self selectButton:sender animated:YES];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

@end
