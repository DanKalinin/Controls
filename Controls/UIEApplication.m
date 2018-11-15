//
//  UIEApplication.m
//  Controls
//
//  Created by Dan Kalinin on 10/31/18.
//

#import "UIEApplication.h"










@interface UIEApplicationPrincipal ()

@end



@implementation UIEApplicationPrincipal

- (instancetype)init {
    self = super.init;
    if (self) {
        (void)UIEApplication.shared;
    }
    return self;
}

@end










@interface UIEApplication ()

@property UIApplication *application;

@end



@implementation UIEApplication

@dynamic delegates;

+ (instancetype)shared {
    static UIEApplication *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = self.new;
    });
    return shared;
}

- (instancetype)init {
    self = super.init;
    if (self) {
        self.application = UIApplication.sharedApplication;
        self.application.delegate = self.delegates;
    }
    return self;
}

@end
