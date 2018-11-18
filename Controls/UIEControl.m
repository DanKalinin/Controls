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

//- (void)UIControlEventTouchDragOutside:(UIEControl *)control;
//- (void)UIControlEventTouchDragEnter:(UIEControl *)control;
//- (void)UIControlEventTouchDragExit:(UIEControl *)control;
//- (void)UIControlEventTouchUpInside:(UIEControl *)control;
//- (void)UIControlEventTouchUpOutside:(UIEControl *)control;
//- (void)UIControlEventTouchCancel:(UIEControl *)control;
//- (void)UIControlEventValueChanged:(UIEControl *)control;
//- (void)UIControlEventPrimaryActionTriggered:(UIEControl *)control;
//- (void)UIControlEventEditingDidBegin:(UIEControl *)control;
//- (void)UIControlEventEditingChanged:(UIEControl *)control;
//- (void)UIControlEventEditingDidEnd:(UIEControl *)control;
//- (void)UIControlEventEditingDidEndOnExit:(UIEControl *)control;

@end
