//
//  UIView.m
//  Controls
//
//  Created by Dan Kalinin on 12/20/18.
//

#import "UIView.h"










@interface UIViewOperation ()

@end



@implementation UIViewOperation

@dynamic object;
@dynamic weakObject;

@end










@implementation UIView (UIE)

- (UIColor *)layerBorderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setLayerBorderColor:(UIColor *)layerBorderColor {
    self.layer.borderColor = layerBorderColor.CGColor;
}

@end
