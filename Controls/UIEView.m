//
//  UIEView.m
//  Controls
//
//  Created by Dan Kalinin on 11/30/18.
//

#import "UIEView.h"










@implementation UIView (UIE)

- (UIColor *)layerBorderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setLayerBorderColor:(UIColor *)layerBorderColor {
    self.layer.borderColor = layerBorderColor.CGColor;
}

@end










@implementation UIViewController (UIE)

@end
