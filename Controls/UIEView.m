//
//  UIEView.m
//  Controls
//
//  Created by Dan Kalinin on 12/20/18.
//

#import "UIEView.h"










@interface UIEViewOperation ()

@end



@implementation UIEViewOperation

@dynamic object;

@end










@implementation UIView (UIE)

@dynamic nseOperation;
@dynamic uieStringTag;

- (Class)nseOperationClass {
    return UIEViewOperation.class;
}

- (UIColor *)uieLayerBorderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setUieLayerBorderColor:(UIColor *)uieLayerBorderColor {
    self.layer.borderColor = uieLayerBorderColor.CGColor;
}

@end










@interface UIEView ()

@end



@implementation UIEView

@end
