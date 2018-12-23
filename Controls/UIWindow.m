//
//  UIWindow.m
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import "UIWindow.h"



@interface UIWindowOperation ()

@end



@implementation UIWindowOperation

@dynamic delegates;
@dynamic object;
@dynamic weakObject;

- (instancetype)initWithWeakObject:(NSObject *)weakObject {
    self = [super initWithWeakObject:weakObject];
    if (self) {
        [self.center addObserver:self selector:@selector(UIWindowDidBecomeVisibleNotification:) name:UIWindowDidBecomeVisibleNotification object:self.weakObject];
        [self.center addObserver:self selector:@selector(UIWindowDidBecomeHiddenNotification:) name:UIWindowDidBecomeHiddenNotification object:self.weakObject];
        [self.center addObserver:self selector:@selector(UIWindowDidBecomeKeyNotification:) name:UIWindowDidBecomeKeyNotification object:self.weakObject];
        [self.center addObserver:self selector:@selector(UIWindowDidResignKeyNotification:) name:UIWindowDidResignKeyNotification object:self.weakObject];
    }
    return self;
}

#pragma mark - Notifications

- (void)UIWindowDidBecomeVisibleNotification:(NSNotification *)notification {
    [self.delegates UIWindowOperationDidBecomeVisible:self];
}

- (void)UIWindowDidBecomeHiddenNotification:(NSNotification *)notification {
    [self.delegates UIWindowOperationDidBecomeHidden:self];
}

- (void)UIWindowDidBecomeKeyNotification:(NSNotification *)notification {
    [self.delegates UIWindowOperationDidBecomeKey:self];
}

- (void)UIWindowDidResignKeyNotification:(NSNotification *)notification {
    [self.delegates UIWindowOperationDidResignKey:self];
}

@end
