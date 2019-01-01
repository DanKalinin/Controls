//
//  UIETextField.m
//  Controls
//
//  Created by Dan Kalinin on 1/2/19.
//

#import "UIETextField.h"










@implementation UITextField (UIE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return UIETextFieldOperation.class;
}

@end










@interface UIETextField ()

@property NSString *uiePattern;
@property BOOL uieClearOnBegin;

@end



@implementation UIETextField

@end










@interface UIETextFieldOperation ()

@end



@implementation UIETextFieldOperation

@dynamic object;

@end
