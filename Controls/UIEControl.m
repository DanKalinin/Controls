//
//  UIEControl.m
//  Controls
//
//  Created by Dan Kalinin on 10/31/18.
//

#import "UIEControl.h"










@interface UIEControlActionInfo ()

@property UIEvent *event;

@end



@implementation UIEControlActionInfo

- (instancetype)initWithEvent:(UIEvent *)event {
    self = super.init;
    if (self) {
        self.event = event;
    }
    return self;
}

@end










@interface UIEControl ()

@property UIControl *control;
@property UIEControlActionInfo *actionInfo;

@end



@implementation UIEControl

@dynamic delegates;

- (instancetype)initWithControl:(UIControl *)control {
    self = super.init;
    if (self) {
        self.control = control;
        
        [self.control addTarget:self action:@selector(UIControlEventTouchDown:event:) forControlEvents:UIControlEventTouchDown];
        [self.control addTarget:self action:@selector(UIControlEventTouchDownRepeat:event:) forControlEvents:UIControlEventTouchDownRepeat];
        [self.control addTarget:self action:@selector(UIControlEventTouchDragInside:event:) forControlEvents:UIControlEventTouchDragInside];
        [self.control addTarget:self action:@selector(UIControlEventTouchDragOutside:event:) forControlEvents:UIControlEventTouchDragOutside];
        [self.control addTarget:self action:@selector(UIControlEventTouchDragEnter:event:) forControlEvents:UIControlEventTouchDragEnter];
        [self.control addTarget:self action:@selector(UIControlEventTouchDragExit:event:) forControlEvents:UIControlEventTouchDragExit];
        [self.control addTarget:self action:@selector(UIControlEventTouchUpInside:event:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

#pragma mark - Actions

- (void)UIControlEventTouchDown:(UIControl *)control event:(UIEvent *)event {
    self.actionInfo = [UIEControlActionInfo.alloc initWithEvent:event];
    [self.delegates UIEControlEventTouchDown:self];
}

- (void)UIControlEventTouchDownRepeat:(UIEControl *)control event:(UIEvent *)event {
    self.actionInfo = [UIEControlActionInfo.alloc initWithEvent:event];
    [self.delegates UIEControlEventTouchDownRepeat:self];
}

- (void)UIControlEventTouchDragInside:(UIEControl *)control event:(UIEvent *)event {
    self.actionInfo = [UIEControlActionInfo.alloc initWithEvent:event];
    [self.delegates UIEControlEventTouchDragInside:self];
}

- (void)UIControlEventTouchDragOutside:(UIEControl *)control event:(UIEvent *)event {
    self.actionInfo = [UIEControlActionInfo.alloc initWithEvent:event];
    [self.delegates UIEControlEventTouchDragOutside:self];
}

- (void)UIControlEventTouchDragEnter:(UIEControl *)control event:(UIEvent *)event {
    self.actionInfo = [UIEControlActionInfo.alloc initWithEvent:event];
    [self.delegates UIEControlEventTouchDragEnter:self];
}

- (void)UIControlEventTouchDragExit:(UIEControl *)control event:(UIEvent *)event {
    self.actionInfo = [UIEControlActionInfo.alloc initWithEvent:event];
    [self.delegates UIEControlEventTouchDragExit:self];
}

- (void)UIControlEventTouchUpInside:(UIEControl *)control event:(UIEvent *)event {
    self.actionInfo = [UIEControlActionInfo.alloc initWithEvent:event];
    [self.delegates UIEControlEventTouchUpInside:self];
}

//- (void)UIControlEventTouchUpOutside:(UIEControl *)control;
//- (void)UIControlEventTouchCancel:(UIEControl *)control;
//- (void)UIControlEventValueChanged:(UIEControl *)control;
//- (void)UIControlEventPrimaryActionTriggered:(UIEControl *)control;
//- (void)UIControlEventEditingDidBegin:(UIEControl *)control;
//- (void)UIControlEventEditingChanged:(UIEControl *)control;
//- (void)UIControlEventEditingDidEnd:(UIEControl *)control;
//- (void)UIControlEventEditingDidEndOnExit:(UIEControl *)control;

@end
