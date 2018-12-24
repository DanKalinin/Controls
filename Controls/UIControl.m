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
@dynamic weakObject;

- (instancetype)initWithWeakObject:(UIControl *)weakObject {
    self = [super initWithWeakObject:weakObject];
    if (self) {
        [self.weakObject addTarget:self action:@selector(UIControlEventTouchDown:event:) forControlEvents:UIControlEventTouchDown];
        [self.weakObject addTarget:self action:@selector(UIControlEventTouchDownRepeat:event:) forControlEvents:UIControlEventTouchDownRepeat];
        [self.weakObject addTarget:self action:@selector(UIControlEventTouchDragInside:event:) forControlEvents:UIControlEventTouchDragInside];
        [self.weakObject addTarget:self action:@selector(UIControlEventTouchDragOutside:event:) forControlEvents:UIControlEventTouchDragOutside];
        [self.weakObject addTarget:self action:@selector(UIControlEventTouchDragEnter:event:) forControlEvents:UIControlEventTouchDragEnter];
        [self.weakObject addTarget:self action:@selector(UIControlEventTouchDragExit:event:) forControlEvents:UIControlEventTouchDragExit];
        [self.weakObject addTarget:self action:@selector(UIControlEventTouchUpInside:event:) forControlEvents:UIControlEventTouchUpInside];
        [self.weakObject addTarget:self action:@selector(UIControlEventTouchUpOutside:event:) forControlEvents:UIControlEventTouchUpOutside];
        [self.weakObject addTarget:self action:@selector(UIControlEventTouchCancel:event:) forControlEvents:UIControlEventTouchCancel];
        
        [self.weakObject addTarget:self action:@selector(UIControlEventValueChanged:event:) forControlEvents:UIControlEventValueChanged];
        [self.weakObject addTarget:self action:@selector(UIControlEventPrimaryActionTriggered:event:) forControlEvents:UIControlEventPrimaryActionTriggered];
        
        [self.weakObject addTarget:self action:@selector(UIControlEventEditingDidBegin:event:) forControlEvents:UIControlEventEditingDidBegin];
        [self.weakObject addTarget:self action:@selector(UIControlEventEditingChanged:event:) forControlEvents:UIControlEventEditingChanged];
        [self.weakObject addTarget:self action:@selector(UIControlEventEditingDidEnd:event:) forControlEvents:UIControlEventEditingDidEnd];
        [self.weakObject addTarget:self action:@selector(UIControlEventEditingDidEndOnExit:event:) forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    return self;
}

#pragma mark - Control

- (void)UIControlEventTouchDown:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates UIControlOperationEventTouchDown:self];
}

- (void)UIControlEventTouchDownRepeat:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates UIControlOperationEventTouchDownRepeat:self];
}

- (void)UIControlEventTouchDragInside:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates UIControlOperationEventTouchDragInside:self];
}

- (void)UIControlEventTouchDragOutside:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates UIControlOperationEventTouchDragOutside:self];
}

- (void)UIControlEventTouchDragEnter:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates UIControlOperationEventTouchDragEnter:self];
}

- (void)UIControlEventTouchDragExit:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates UIControlOperationEventTouchDragExit:self];
}

- (void)UIControlEventTouchUpInside:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates UIControlOperationEventTouchUpInside:self];
}

- (void)UIControlEventTouchUpOutside:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates UIControlOperationEventTouchUpOutside:self];
}

- (void)UIControlEventTouchCancel:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates UIControlOperationEventTouchCancel:self];
}

- (void)UIControlEventValueChanged:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates UIControlOperationEventValueChanged:self];
}

- (void)UIControlEventPrimaryActionTriggered:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates UIControlOperationEventPrimaryActionTriggered:self];
}

- (void)UIControlEventEditingDidBegin:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates UIControlOperationEventEditingDidBegin:self];
}

- (void)UIControlEventEditingChanged:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates UIControlOperationEventEditingChanged:self];
}

- (void)UIControlEventEditingDidEnd:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates UIControlOperationEventEditingDidEnd:self];
}

- (void)UIControlEventEditingDidEndOnExit:(UIControl *)control event:(UIEvent *)event {
    self.eventInfo = [UIControlOperationEventInfo.alloc initWithEvent:event];
    [self.delegates UIControlOperationEventEditingDidEndOnExit:self];
}

#pragma mark - Control operation

- (void)UIControlOperationDidSetEnabled:(UIControlOperation *)operation {
    if (self.weakObject.enabled) {
        self.weakObject.backgroundColor = self.weakObject.defaultBackgroundColor;
        self.weakObject.layerBorderColor = self.weakObject.defaultLayerBorderColor;
    } else {
        self.weakObject.backgroundColor = self.weakObject.disabledBackgroundColor;
        self.weakObject.layerBorderColor = self.weakObject.disabledLayerBorderColor;
    }
}

- (void)UIControlOperationDidSetSelected:(UIControlOperation *)operation {
    if (self.weakObject.selected) {
        self.weakObject.backgroundColor = self.weakObject.selectedBackgroundColor;
        self.weakObject.layerBorderColor = self.weakObject.selectedLayerBorderColor;
    } else {
        self.weakObject.backgroundColor = self.weakObject.defaultBackgroundColor;
        self.weakObject.layerBorderColor = self.weakObject.defaultLayerBorderColor;
    }
}

- (void)UIControlOperationDidSetHighlighted:(UIControlOperation *)operation {
    if (self.weakObject.highlighted) {
        self.weakObject.backgroundColor = self.weakObject.highlightedBackgroundColor;
        self.weakObject.layerBorderColor = self.weakObject.highlightedLayerBorderColor;
    } else {
        self.weakObject.backgroundColor = self.weakObject.defaultBackgroundColor;
        self.weakObject.layerBorderColor = self.weakObject.defaultLayerBorderColor;
    }
}

@end










@implementation UIControl (UIE)

@dynamic defaultBackgroundColor;
@dynamic highlightedBackgroundColor;
@dynamic selectedBackgroundColor;
@dynamic disabledBackgroundColor;

@dynamic defaultLayerBorderColor;
@dynamic highlightedLayerBorderColor;
@dynamic selectedLayerBorderColor;
@dynamic disabledLayerBorderColor;

@end
