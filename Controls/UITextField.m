//
//  UITextField.m
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import "UITextField.h"



@interface UITextFieldOperation ()

@end



@implementation UITextFieldOperation

@dynamic delegates;
@dynamic object;
@dynamic weakObject;

- (instancetype)initWithWeakObject:(UITextField *)weakObject {
    self = [super initWithWeakObject:weakObject];
    if (self) {
        self.weakObject.delegate = self.delegates;
    }
    return self;
}

@end
