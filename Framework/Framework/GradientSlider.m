//
//  GradientSlider.m
//  Framework
//
//  Created by Dan Kalinin on 14/11/16.
//  Copyright © 2016 Dan Kalinin. All rights reserved.
//

#import "GradientSlider.h"



@interface GradientSlider ()

@property double value;
@property CAGradientLayer *gradientLayer;

@end



@implementation GradientSlider

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.valueConstraint.constant = 0.0;
    
    [self.minButton addTarget:self action:@selector(onStep:) forControlEvents:UIControlEventTouchDown];
    [self.maxButton addTarget:self action:@selector(onStep:) forControlEvents:UIControlEventTouchDown];

    UIColor *minTitleColor = [self.minButton titleColorForState:UIControlStateHighlighted];
    UIColor *maxTitleColor = [self.maxButton titleColorForState:UIControlStateHighlighted];
    [self.minButton setTitleColor:minTitleColor forState:(UIControlStateHighlighted | UIControlStateSelected)];
    [self.maxButton setTitleColor:maxTitleColor forState:(UIControlStateHighlighted | UIControlStateSelected)];
    
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.colors = @[(id)self.minColor.CGColor, (id)self.maxColor.CGColor];
    self.gradientLayer.startPoint = CGPointMake(0.0, 0.0);
    self.gradientLayer.endPoint = CGPointMake(1.0, 0.0);
    [self.valueView.layer insertSublayer:self.gradientLayer atIndex:0];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.gradientLayer.frame = self.bounds;
}

- (void)setValue:(double)value animated:(BOOL)animated {
    self.value = value;
    
    NSTimeInterval duration = self.duration * animated;
    self.valueConstraint.constant = [self constantForValue:value];
    [UIView animateWithDuration:duration animations:^{
        [self.valueView.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
        BOOL minButtonSelected = (self.valueConstraint.constant > self.minButton.center.x);
        BOOL valueLabelHighlighted = (self.valueConstraint.constant > self.valueLabel.center.x);
        BOOL maxButtonSelected = (self.valueConstraint.constant > self.maxButton.center.x);
        
        self.minButton.selected = minButtonSelected;
        self.valueLabel.highlighted = valueLabelHighlighted;
        self.maxButton.selected = maxButtonSelected;
    }];
}

#pragma mark - Actions

- (void)onStep:(UIButton *)sender {
    if (!(sender.state & UIControlStateHighlighted)) return;
    
    double value;
    if ([sender isEqual:self.minButton]) {
        value = self.value - self.step;
        value = fmax(self.minValue, value);
    } else {
        value = self.value + self.step;
        value = fmin(self.maxValue, value);
    }
    
    double oldValue = self.value;
    [self setValue:value animated:sender.tag];
    [self reportValueChanged:oldValue];
    
    [self performSelector:@selector(onStep:) withObject:sender afterDelay:0.1];
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint point = [touch locationInView:self];
    double value = [self valueForConstant:point.x];
    
    double oldValue = self.value;
    [self setValue:value animated:self.tag];
    [self reportValueChanged:oldValue];
    
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint point = [touch locationInView:self];
    double value = [self valueForConstant:point.x];
    
    double oldValue = self.value;
    [self setValue:value animated:NO];
    [self reportValueChanged:oldValue];
    
    return YES;
}

#pragma mark - Helpers

- (double)valueForConstant:(CGFloat)constant {
    double percent = constant / self.frame.size.width;
    double range = self.maxValue - self.minValue;
    double value = self.minValue + range * percent;
    return value;
}

- (CGFloat)constantForValue:(double)value {
    double percent = (value - self.minValue) / (self.maxValue - self.minValue);
    CGFloat constant = self.frame.size.width * percent;
    return constant;
}

- (void)reportValueChanged:(double)oldValue {
    if (fabs(self.value - oldValue) >= self.step) {
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

@end
