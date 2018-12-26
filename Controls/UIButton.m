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

#pragma mark - Control operation

- (void)UIControlOperationEventTouchUpInside:(UIButtonOperation *)operation {
    [super UIControlOperationEventTouchUpInside:self];
    
    [self.delegates UIButtonOperationEventTouchUpInside:self];
}

#pragma mark - Button operation

- (void)UIButtonOperationEventTouchUpInside:(UIButtonOperation *)operation {
    
}

@end










@implementation UIButton (UIE)

@dynamic operation;

- (Class)operationClass {
    return UIButtonOperation.class;
}

@end
