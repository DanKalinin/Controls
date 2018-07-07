//
//  CTLWindow.m
//  Controls
//
//  Created by Dan Kalinin on 7/7/18.
//

#import "CTLWindow.h"










@interface CTLWindow ()

@end



@implementation CTLWindow

@end










@interface CTLKeyboardInfo ()

@property CGRect frameBegin;
@property CGRect frameEnd;
@property NSTimeInterval animationDuration;
@property UIViewAnimationCurve animationCurve;
@property BOOL isLocal;

@end



@implementation CTLKeyboardInfo

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = super.init;
    if (self) {
        self.frameBegin = [dictionary[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
        self.frameEnd = [dictionary[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        self.animationDuration = [dictionary[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        self.animationCurve = [dictionary[UIKeyboardAnimationCurveUserInfoKey] integerValue];
        self.isLocal = [dictionary[UIKeyboardIsLocalUserInfoKey] boolValue];
    }
    return self;
}

@end
