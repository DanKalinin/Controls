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

@end










@implementation UIView (UIE)

@dynamic operation;
@dynamic stringTag;

- (Class)operationClass {
    return UIViewOperation.class;
}

- (UIColor *)layerBorderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setLayerBorderColor:(UIColor *)layerBorderColor {
    self.layer.borderColor = layerBorderColor.CGColor;
}

@end
