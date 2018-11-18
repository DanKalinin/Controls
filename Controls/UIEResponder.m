//
//  UIEResponder.m
//  Controls
//
//  Created by Dan Kalinin on 11/19/18.
//

#import "UIEResponder.h"










@interface UIEResponder ()

@end



@implementation UIEResponder

@end










@interface UIEResponderManager ()

@property (weak) UIResponder *responder;

@end



@implementation UIEResponderManager

- (instancetype)initWithResponder:(UIResponder *)responder {
    self = super.init;
    if (self) {
        self.responder = responder;
    }
    return self;
}

@end
