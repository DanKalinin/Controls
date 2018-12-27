//
//  UIControl.m
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import "UIControl.h"










@interface UIControlOperationEventInfo ()

@property UIEvent *event;

@end



@implementation UIControlOperationEventInfo

- (instancetype)initWithEvent:(UIEvent *)event {
    self = super.init;
    if (self) {
        self.event = event;
    }
    return self;
}

@end










@interface UIControlOperation ()

@property UIControlOperationEventInfo *eventInfo;

@end



@implementation UIControlOperation

@dynamic delegates;
@dynamic object;

- (instancetype)initWithObject:(UIControl *)object {
    self = [super initWithObject:object];
    if (self) {
        [self.object addTarget:self action:@selector(uiControlEventTouchDown:event:) forControlEvents:UIControlEventTouchDown];
        [self.object addTarget:self action:@selector(uiControlEventTouchDownRepeat:event:) forControlEvents:UIControlEventTouchDownRepeat];
        [self.object addTarget:self action:@selector(uiControlEventTouchDragInside:event:) forControlEvents:UIControlEventTouchDragInside];
        [self.object addTarget:self action:@selector(uiControlEventTouchDragOutside:event:) forControlEvents:UIControlEventTouchDragOutside];
        [self.object addTarget:self action:@selector(uiControlEventTouchDragEnter:event:) forControlEvents:UIControlEventTouchDragEnter];
        [self.object addTarget:self action:@selector(uiControlEventTouchDragExit:event:) forControlEvents:UIControlEventTouchDragExit];
        [self.object addTarget:self action:@selector(uiControlEventTouchUpInside:event:) forControlEvents:UIControlEventTouchUpInside];
        [self.object addTarget:self action:@selector(uiControlEventTouchUpOutside:event:) forControlEvents:UIControlEventTouchUpOutside];
        [self.object addTarget:self action:@selector(uiControlEventTouchCancel:event:) forControlEvents:UIControlEventTouchCancel];
        
        [self.object addTarget:self action:@selector(uiControlEventValueChanged:event:) forControlEvents:UIControlEventValueChanged];
        [self.object addTarget:self action:@selector(uiControlEventPrimaryActionTriggered:event:) forControlEvents:UIControlEventPrimaryActionTriggered];
        
        [self.object addTarget:self action:@selector(uiControlEventEditingDidBegin:event:) forControlEvents:UIControlEventEditingDidBegin];
        [self.object addTarget:self action:@selector(uiControlEventEditingChanged:event:) forControlEvents:UIControlEventEditingChanged];
        [self.object addTarget:self action:@selector(uiControlEventEditingDidEnd:event:) forControlEvents:UIControlEventEditingDidEnd];
        [self.object addTarget:self action:@selector(uiControlEventEditingDidEndOnExit:event:) forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    return self;
}

#pragma mark - Control

- (void)uiControlEventTouchDown:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEventTouchDown:self];
}

- (void)uiControlEventTouchDownRepeat:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEventTouchDownRepeat:self];
}

- (void)uiControlEventTouchDragInside:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEventTouchDragInside:self];
}

- (void)uiControlEventTouchDragOutside:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEventTouchDragOutside:self];
}

- (void)uiControlEventTouchDragEnter:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEventTouchDragEnter:self];
}

- (void)uiControlEventTouchDragExit:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEventTouchDragExit:self];
}

- (void)uiControlEventTouchUpInside:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEventTouchUpInside:self];
}

- (void)uiControlEventTouchUpOutside:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEventTouchUpOutside:self];
}

- (void)uiControlEventTouchCancel:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEventTouchCancel:self];
}

- (void)uiControlEventValueChanged:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEventValueChanged:self];
}

- (void)uiControlEventPrimaryActionTriggered:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEventPrimaryActionTriggered:self];
}

- (void)uiControlEventEditingDidBegin:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEventEditingDidBegin:self];
}

- (void)uiControlEventEditingChanged:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEventEditingChanged:self];
}

- (void)uiControlEventEditingDidEnd:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEventEditingDidEnd:self];
}

- (void)uiControlEventEditingDidEndOnExit:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEventEditingDidEndOnExit:self];
}

#pragma mark - Control operation

- (void)uiControlOperationDidSetEnabled:(UIControlOperation *)operation {
    if (self.object.enabled) {
        self.object.backgroundColor = self.object.uieDefaultBackgroundColor;
        self.object.uieLayerBorderColor = self.object.uieDefaultLayerBorderColor;
    } else {
        self.object.backgroundColor = self.object.uieDisabledBackgroundColor;
        self.object.uieLayerBorderColor = self.object.uieDisabledLayerBorderColor;
    }
}

- (void)uiControlOperationDidSetSelected:(UIControlOperation *)operation {
    if (self.object.selected) {
        self.object.backgroundColor = self.object.uieSelectedBackgroundColor;
        self.object.uieLayerBorderColor = self.object.uieSelectedLayerBorderColor;
    } else {
        self.object.backgroundColor = self.object.uieDefaultBackgroundColor;
        self.object.uieLayerBorderColor = self.object.uieDefaultLayerBorderColor;
    }
}

- (void)uiControlOperationDidSetHighlighted:(UIControlOperation *)operation {
    if (self.object.highlighted) {
        self.object.backgroundColor = self.object.uieHighlightedBackgroundColor;
        self.object.uieLayerBorderColor = self.object.uieHighlightedLayerBorderColor;
    } else {
        self.object.backgroundColor = self.object.uieDefaultBackgroundColor;
        self.object.uieLayerBorderColor = self.object.uieDefaultLayerBorderColor;
    }
}

- (void)uiControlOperationEventTouchDown:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationEventTouchDownRepeat:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationEventTouchDragInside:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationEventTouchDragOutside:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationEventTouchDragEnter:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationEventTouchDragExit:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationEventTouchUpInside:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationEventTouchUpOutside:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationEventTouchCancel:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationEventValueChanged:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationEventPrimaryActionTriggered:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationEventEditingDidBegin:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationEventEditingChanged:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationEventEditingDidEnd:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationEventEditingDidEndOnExit:(UIControlOperation *)operation {
    
}

@end










@implementation UIControl (UIE)

@dynamic uieDefaultBackgroundColor;
@dynamic uieHighlightedBackgroundColor;
@dynamic uieSelectedBackgroundColor;
@dynamic uieDisabledBackgroundColor;
@dynamic uieDefaultLayerBorderColor;
@dynamic uieHighlightedLayerBorderColor;
@dynamic uieSelectedLayerBorderColor;
@dynamic uieDisabledLayerBorderColor;

- (Class)nseOperationClass {
    return UIControlOperation.class;
}

@end
