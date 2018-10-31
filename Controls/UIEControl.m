//
//  UIEControl.m
//  Controls
//
//  Created by Dan Kalinin on 10/31/18.
//

#import "UIEControl.h"



@interface UIEControl ()

@property UIControl *control;

@end



@implementation UIEControl

- (instancetype)initWithControl:(UIControl *)control {
    self = super.init;
    if (self) {
        self.control = control;
    }
    return self;
}

@end
