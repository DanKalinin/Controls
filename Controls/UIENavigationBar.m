//
//  UIENavigationBar.m
//  Controls
//
//  Created by Dan Kalinin on 12/8/18.
//

#import "UIENavigationBar.h"










@interface UIENavigationBar ()

@property UIENavigationBarOperation *operation;

@end



@implementation UIENavigationBar

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.operation = [self.operationClass.alloc initWithNavigationBar:self];
    }
    return self;
}

- (Class)operationClass {
    return UIENavigationBarOperation.class;
}

@end










@interface UIENavigationBarOperation ()

@property (weak) UIENavigationBar *navigationBar;

@end



@implementation UIENavigationBarOperation

@dynamic delegates;

- (instancetype)initWithNavigationBar:(UIENavigationBar *)navigationBar {
    self = super.init;
    if (self) {
        self.navigationBar = navigationBar;
        self.navigationBar.delegate = self.delegates;
    }
    return self;
}

@end
