//
//  UIEButton.m
//  Controls
//
//  Created by Dan Kalinin on 1/1/19.
//

#import "UIEButton.h"










@implementation UIButton (UIE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return UIEButtonOperation.class;
}

@end










@interface UIEButton ()

@property UIColor *uieDefaultBackgroundColor;
@property UIColor *uieHighlightedBackgroundColor;
@property UIColor *uieSelectedBackgroundColor;
@property UIColor *uieDisabledBackgroundColor;
@property UIColor *uieDefaultLayerBorderColor;
@property UIColor *uieHighlightedLayerBorderColor;
@property UIColor *uieSelectedLayerBorderColor;
@property UIColor *uieDisabledLayerBorderColor;

@end



@implementation UIEButton

@end










@interface UIEButtonOperation ()

@end



@implementation UIEButtonOperation

@dynamic delegates;
@dynamic object;

- (void)touchUpInside:(UIButton *)sender event:(UIEvent *)event {
    [super touchUpInside:sender event:event];
    
    [self.delegates uieButtonTouchUpInside:sender];
}

@end
