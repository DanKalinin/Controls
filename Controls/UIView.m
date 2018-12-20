//
//  UIView.m
//  Controls
//
//  Created by Dan Kalinin on 12/20/18.
//

#import "UIView.h"



@implementation UIView (UIE)

- (UIColor *)layerBorderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setLayerBorderColor:(UIColor *)layerBorderColor {
    self.layer.borderColor = layerBorderColor.CGColor;
}

@end
