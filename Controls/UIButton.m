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

- (void)uiControlOperationEventTouchUpInside:(UIButtonOperation *)operation {
    [super uiControlOperationEventTouchUpInside:self];
    
    [self.delegates uiButtonOperationEventTouchUpInside:self];
}

#pragma mark - Button

- (void)uiButtonOperationEventTouchUpInside:(UIButtonOperation *)operation {
    
}

@end










@implementation UIButton (UIE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return UIButtonOperation.class;
}

@end
