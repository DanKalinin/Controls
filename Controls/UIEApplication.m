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
    }
    return self;
}

- (int)main:(int)argc argv:(char **)argv {
    return UIApplicationMain(argc, argv, NSStringFromClass(UIEApplicationPrincipal.class), nil);
}

@end










@interface UIEApplicationPrincipal ()

@end



@implementation UIEApplicationPrincipal

- (instancetype)init {
    self = super.init;
    if (self) {
        UIEApplication.shared.application = self;
        self.delegate = UIEApplication.shared.delegates;
    }
    return self;
}

@end
