//
//  UIEWindow.m
//  Controls
//
//  Created by Dan Kalinin on 12/21/18.
//

#import "UIEWindow.h"










@interface UIEWindow ()

@property UIEWindowOperation *operation;

@end



@implementation UIEWindow

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.operation = [self.operationClass.alloc initWithWindow:self];
    }
    return self;
}

- (Class)operationClass {
    return UIEWindowOperation.class;
}

@end










@interface UIEWindowOperation ()

@property (weak) UIEWindow *window;

@end



@implementation UIEWindowOperation

- (instancetype)initWithWindow:(UIEWindow *)window {
    self = super.init;
    if (self) {
        self.window = window;
        
        [self.center addObserver:self selector:@selector(UIWindowDidBecomeVisibleNotification:) name:UIWindowDidBecomeVisibleNotification object:self.window];
        [self.center addObserver:self selector:@selector(UIWindowDidBecomeHiddenNotification:) name:UIWindowDidBecomeHiddenNotification object:self.window];
        [self.center addObserver:self selector:@selector(UIWindowDidBecomeKeyNotification:) name:UIWindowDidBecomeKeyNotification object:self.window];
        [self.center addObserver:self selector:@selector(UIWindowDidResignKeyNotification:) name:UIWindowDidResignKeyNotification object:self.window];
    }
    return self;
}

#pragma mark - Notifications

- (void)UIWindowDidBecomeVisibleNotification:(NSNotification *)notification {
    
}

- (void)UIWindowDidBecomeHiddenNotification:(NSNotification *)notification {
    
}

- (void)UIWindowDidBecomeKeyNotification:(NSNotification *)notification {
    
}

- (void)UIWindowDidResignKeyNotification:(NSNotification *)notification {
    
}

@end
