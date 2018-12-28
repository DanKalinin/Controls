//
//  UIButton.m
//  Controls
//
//  Created by Dan Kalinin on 12/24/18.
//

#import "UIButton.h"










@interface UIButtonOperation ()

@end



@implementation UIButtonOperation

@dynamic delegates;
@dynamic weakObject;

#pragma mark - Control

- (void)uiControlOperationTouchUpInside:(UIButtonOperation *)operation {
    [super uiControlOperationTouchUpInside:self];
    
    [self.delegates uiButtonOperationTouchUpInside:self];
}

#pragma mark - Button

- (void)uiButtonOperationTouchUpInside:(UIButtonOperation *)operation {
    
}

@end










@implementation UIButton (UIE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return UIButtonOperation.class;
}

@end
