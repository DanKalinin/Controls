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

@dynamic nseOperation;
@dynamic uieStringTag;

- (Class)nseOperationClass {
    return UIViewOperation.class;
}

- (UIColor *)uieLayerBorderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setUieLayerBorderColor:(UIColor *)uieLayerBorderColor {
    self.layer.borderColor = uieLayerBorderColor.CGColor;
}

@end
