//
//  UnderscoredButtonsView.m
//  Framework
//
//  Created by Dan Kalinin on 14/11/16.
//  Copyright © 2016 Dan Kalinin. All rights reserved.
//

#import "TabControl.h"










@interface TabControlConfiguration ()

@end



@implementation TabControlConfiguration

@end










@interface TabControl ()

@property UIButton *button;

@end



@implementation TabControl

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setConfiguration:self.configuration];
}

- (void)setConfiguration:(TabControlConfiguration *)configuration {
    _configuration = configuration;
    
    for (UIView *view in configuration.stackView.arrangedSubviews) {
        [configuration.stackView removeArrangedSubview:view];
        [view removeFromSuperview];
    }
    
    for (UIButton *button in configuration.buttons) {
        [configuration.stackView addArrangedSubview:button];
        [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (configuration.button) {
        [configuration.stackView layoutIfNeeded];
        [self selectButton:configuration.button animated:NO];
    }
}

- (void)selectButton:(UIButton *)button animated:(BOOL)animated {
    
    self.button.selected = NO;
    button.selected = YES;
    
    self.button = button;
    
    NSTimeInterval duration = 0.25 * animated;
    [self.configuration.underscoreView.superview layoutIfNeeded];
    [UIView animateWithDuration:duration animations:^{
        self.configuration.leadingConstraint.constant = button.frame.origin.x;
        self.configuration.widthConstraint.constant = button.frame.size.width;
        [self.configuration.underscoreView.superview layoutIfNeeded];
    }];
    
    CGFloat x = button.frame.origin.x - self.configuration.stackView.spacing;
    CGFloat width = button.frame.size.width + 2.0 * self.configuration.stackView.spacing;
    CGRect rect = CGRectMake(x, 0.0, width, 1.0);
    [self.configuration.scrollView scrollRectToVisible:rect animated:animated];
}

#pragma mark - Actions

- (void)onClick:(UIButton *)sender {
    
    if ([sender isEqual:self.button]) return;
    
    [self selectButton:sender animated:YES];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

@end
