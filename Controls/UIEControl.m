//
//  UIEControl.m
//  Controls
//
//  Created by Dan Kalinin on 10/31/18.
//

#import "UIEControl.h"










@interface UIEControl ()

@end



@implementation UIEControl

@end










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










@interface UIEControlManager ()

@property UIEControlActionInfo *actionInfo;

@end



@implementation UIEControlManager

@dynamic delegates;
@dynamic responder;

- (instancetype)initWithResponder:(UIResponder *)responder {
    self = [super initWithResponder:responder];
    if (self) {
        [self.responder addTarget:self action:@selector(UIControlEventTouchDown:event:) forControlEvents:UIControlEventTouchDown];
        [self.responder addTarget:self action:@selector(UIControlEventTouchDownRepeat:event:) forControlEvents:UIControlEventTouchDownRepeat];
        [self.responder addTarget:self action:@selector(UIControlEventTouchDragInside:event:) forControlEvents:UIControlEventTouchDragInside];
        [self.responder addTarget:self action:@selector(UIControlEventTouchDragOutside:event:) forControlEvents:UIControlEventTouchDragOutside];
        [self.responder addTarget:self action:@selector(UIControlEventTouchDragEnter:event:) forControlEvents:UIControlEventTouchDragEnter];
        [self.responder addTarget:self action:@selector(UIControlEventTouchDragExit:event:) forControlEvents:UIControlEventTouchDragExit];
        [self.responder addTarget:self action:@selector(UIControlEventTouchUpInside:event:) forControlEvents:UIControlEventTouchUpInside];
        [self.responder addTarget:self action:@selector(UIControlEventTouchUpOutside:event:) forControlEvents:UIControlEventTouchUpOutside];
        [self.responder addTarget:self action:@selector(UIControlEventTouchCancel:event:) forControlEvents:UIControlEventTouchCancel];
        [self.responder addTarget:self action:@selector(UIControlEventValueChanged:event:) forControlEvents:UIControlEventValueChanged];
        [self.responder addTarget:self action:@selector(UIControlEventPrimaryActionTriggered:event:) forControlEvents:UIControlEventPrimaryActionTriggered];
        [self.responder addTarget:self action:@selector(UIControlEventEditingDidBegin:event:) forControlEvents:UIControlEventEditingDidBegin];
        [self.responder addTarget:self action:@selector(UIControlEventEditingChanged:event:) forControlEvents:UIControlEventEditingChanged];
        [self.responder addTarget:self action:@selector(UIControlEventEditingDidEnd:event:) forControlEvents:UIControlEventEditingDidEnd];
        [self.responder addTarget:self action:@selector(UIControlEventEditingDidEndOnExit:event:) forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    return self;
}

#pragma mark - Actions

- (void)UIControlEventTouchDown:(UIControl *)control event:(UIEvent *)event {
    self.actionInfo = [UIEControlActionInfo.alloc initWithEvent:event];
    [self.delegates UIEControlEventTouchDown:self];
}

- (void)UIControlEventTouchDownRepeat:(UIControl *)control event:(UIEvent *)event {
    self.actionInfo = [UIEControlActionInfo.alloc initWithEvent:event];
    [self.delegates UIEControlEventTouchDownRepeat:self];
}

- (void)UIControlEventTouchDragInside:(UIControl *)control event:(UIEvent *)event {
    self.actionInfo = [UIEControlActionInfo.alloc initWithEvent:event];
    [self.delegates UIEControlEventTouchDragInside:self];
}

- (void)UIControlEventTouchDragOutside:(UIControl *)control event:(UIEvent *)event {
    self.actionInfo = [UIEControlActionInfo.alloc initWithEvent:event];
    [self.delegates UIEControlEventTouchDragOutside:self];
}

- (void)UIControlEventTouchDragEnter:(UIControl *)control event:(UIEvent *)event {
    self.actionInfo = [UIEControlActionInfo.alloc initWithEvent:event];
    [self.delegates UIEControlEventTouchDragEnter:self];
}

- (void)UIControlEventTouchDragExit:(UIControl *)control event:(UIEvent *)event {
    self.actionInfo = [UIEControlActionInfo.alloc initWithEvent:event];
    [self.delegates UIEControlEventTouchDragExit:self];
}

- (void)UIControlEventTouchUpInside:(UIControl *)control event:(UIEvent *)event {
    self.actionInfo = [UIEControlActionInfo.alloc initWithEvent:event];
    [self.delegates UIEControlEventTouchUpInside:self];
}

- (void)UIControlEventTouchUpOutside:(UIControl *)control event:(UIEvent *)event {
    self.actionInfo = [UIEControlActionInfo.alloc initWithEvent:event];
    [self.delegates UIEControlEventTouchUpOutside:self];
}

- (void)UIControlEventTouchCancel:(UIControl *)control event:(UIEvent *)event {
    self.actionInfo = [UIEControlActionInfo.alloc initWithEvent:event];
    [self.delegates UIEControlEventTouchCancel:self];
}

- (void)UIControlEventValueChanged:(UIControl *)control event:(UIEvent *)event {
    self.actionInfo = [UIEControlActionInfo.alloc initWithEvent:event];
    [self.delegates UIEControlEventValueChanged:self];
}

- (void)UIControlEventPrimaryActionTriggered:(UIControl *)control event:(UIEvent *)event {
    self.actionInfo = [UIEControlActionInfo.alloc initWithEvent:event];
    [self.delegates UIEControlEventPrimaryActionTriggered:self];
}

- (void)UIControlEventEditingDidBegin:(UIControl *)control event:(UIEvent *)event {
    self.actionInfo = [UIEControlActionInfo.alloc initWithEvent:event];
    [self.delegates UIEControlEventEditingDidBegin:self];
}

- (void)UIControlEventEditingChanged:(UIControl *)control event:(UIEvent *)event {
    self.actionInfo = [UIEControlActionInfo.alloc initWithEvent:event];
    [self.delegates UIEControlEventEditingChanged:self];
}

- (void)UIControlEventEditingDidEnd:(UIControl *)control event:(UIEvent *)event {
    self.actionInfo = [UIEControlActionInfo.alloc initWithEvent:event];
    [self.delegates UIEControlEventEditingDidEnd:self];
}

- (void)UIControlEventEditingDidEndOnExit:(UIControl *)control event:(UIEvent *)event {
    self.actionInfo = [UIEControlActionInfo.alloc initWithEvent:event];
    [self.delegates UIEControlEventEditingDidEndOnExit:self];
}

@end
