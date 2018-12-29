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

@end










@implementation UIButton (UIE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return UIButtonOperation.class;
}

@end
