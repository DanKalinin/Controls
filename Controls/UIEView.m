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

- (UIColor *)layerBorderColor {
    return [UIColor colorWithCGColor:self.object.layer.borderColor];
}

- (void)setLayerBorderColor:(UIColor *)layerBorderColor {
    self.object.layer.borderColor = layerBorderColor.CGColor;
}

@end










@implementation UIView (UIE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return UIEViewOperation.class;
}

@end










@interface UIEView ()

@end



@implementation UIEView

@end
