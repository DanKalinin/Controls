//
//  UIEApplication.m
//  Controls
//
//  Created by Dan Kalinin on 10/31/18.
//

#import "UIEApplication.h"



@interface UIEApplication ()

@property UIApplication *application;

@end



@implementation UIEApplication

@dynamic delegates;

- (instancetype)init {
    self = super.init;
    if (self) {
        self.application = UIApplication.sharedApplication;
        self.application.delegate = self.delegates;
    }
    return self;
}

@end
