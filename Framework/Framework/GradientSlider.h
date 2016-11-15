//
//  GradientSlider.h
//  Framework
//
//  Created by Dan Kalinin on 14/11/16.
//  Copyright © 2016 Dan Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface GradientSlider : UIControl

@property IBInspectable double minValue;
@property IBInspectable double maxValue;
@property IBInspectable double step;

@property IBInspectable UIColor *minColor;
@property IBInspectable UIColor *maxColor;

@property IBInspectable NSTimeInterval duration;

@property (weak, nonatomic) IBOutlet UIButton *minButton;
@property (weak, nonatomic) IBOutlet UIButton *maxButton;

@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@property (weak, nonatomic) IBOutlet UIView *valueView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *valueConstraint;

@property (readonly) double value;
- (void)setValue:(double)value animated:(BOOL)animated;

@end
