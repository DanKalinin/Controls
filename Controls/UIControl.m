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
        [self.object addTarget:self action:@selector(UIControlEventTouchDown:event:) forControlEvents:UIControlEventTouchDown];
        [self.object addTarget:self action:@selector(UIControlEventTouchDownRepeat:event:) forControlEvents:UIControlEventTouchDownRepeat];
        [self.object addTarget:self action:@selector(UIControlEventTouchDragInside:event:) forControlEvents:UIControlEventTouchDragInside];
        [self.object addTarget:self action:@selector(UIControlEventTouchDragOutside:event:) forControlEvents:UIControlEventTouchDragOutside];
        [self.object addTarget:self action:@selector(UIControlEventTouchDragEnter:event:) forControlEvents:UIControlEventTouchDragEnter];
        [self.object addTarget:self action:@selector(UIControlEventTouchDragExit:event:) forControlEvents:UIControlEventTouchDragExit];
        [self.object addTarget:self action:@selector(UIControlEventTouchUpInside:event:) forControlEvents:UIControlEventTouchUpInside];
        [self.object addTarget:self action:@selector(UIControlEventTouchUpOutside:event:) forControlEvents:UIControlEventTouchUpOutside];
        [self.object addTarget:self action:@selector(UIControlEventTouchCancel:event:) forControlEvents:UIControlEventTouchCancel];
        
        [self.object addTarget:self action:@selector(UIControlEventValueChanged:event:) forControlEvents:UIControlEventValueChanged];
        [self.object addTarget:self action:@selector(UIControlEventPrimaryActionTriggered:event:) forControlEvents:UIControlEventPrimaryActionTriggered];
        
        [self.object addTarget:self action:@selector(UIControlEventEditingDidBegin:event:) forControlEvents:UIControlEventEditingDidBegin];
        [self.object addTarget:self action:@selector(UIControlEventEditingChanged:event:) forControlEvents:UIControlEventEditingChanged];
        [self.object addTarget:self action:@selector(UIControlEventEditingDidEnd:event:) forControlEvents:UIControlEventEditingDidEnd];
        [self.object addTarget:self action:@selector(UIControlEventEditingDidEndOnExit:event:) forControlEvents:UIControlEventEditingDidEndOnExit];
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
    if (self.object.enabled) {
        self.object.backgroundColor = self.defaultBackgroundColor;
        self.object.layerBorderColor = self.defaultLayerBorderColor;
    } else {
        self.object.backgroundColor = self.disabledBackgroundColor;
        self.object.layerBorderColor = self.disabledLayerBorderColor;
    }
}

- (void)UIControlOperationDidSetSelected:(UIControlOperation *)operation {
    if (self.object.selected) {
        self.object.backgroundColor = self.selectedBackgroundColor;
        self.object.layerBorderColor = self.selectedLayerBorderColor;
    } else {
        self.object.backgroundColor = self.defaultBackgroundColor;
        self.object.layerBorderColor = self.defaultLayerBorderColor;
    }
}

- (void)UIControlOperationDidSetHighlighted:(UIControlOperation *)operation {
    if (self.object.highlighted) {
        self.object.backgroundColor = self.highlightedBackgroundColor;
        self.object.layerBorderColor = self.highlightedLayerBorderColor;
    } else {
        self.object.backgroundColor = self.defaultBackgroundColor;
        self.object.layerBorderColor = self.defaultLayerBorderColor;
    }
}

- (void)UIControlOperationEventTouchDown:(UIControlOperation *)operation {
    
}

- (void)UIControlOperationEventTouchDownRepeat:(UIControlOperation *)operation {
    
}

- (void)UIControlOperationEventTouchDragInside:(UIControlOperation *)operation {
    
}

- (void)UIControlOperationEventTouchDragOutside:(UIControlOperation *)operation {
    
}

- (void)UIControlOperationEventTouchDragEnter:(UIControlOperation *)operation {
    
}

- (void)UIControlOperationEventTouchDragExit:(UIControlOperation *)operation {
    
}

- (void)UIControlOperationEventTouchUpInside:(UIControlOperation *)operation {
    
}

- (void)UIControlOperationEventTouchUpOutside:(UIControlOperation *)operation {
    
}

- (void)UIControlOperationEventTouchCancel:(UIControlOperation *)operation {
    
}

- (void)UIControlOperationEventValueChanged:(UIControlOperation *)operation {
    
}

- (void)UIControlOperationEventPrimaryActionTriggered:(UIControlOperation *)operation {
    
}

- (void)UIControlOperationEventEditingDidBegin:(UIControlOperation *)operation {
    
}

- (void)UIControlOperationEventEditingChanged:(UIControlOperation *)operation {
    
}

- (void)UIControlOperationEventEditingDidEnd:(UIControlOperation *)operation {
    
}

- (void)UIControlOperationEventEditingDidEndOnExit:(UIControlOperation *)operation {
    
}

@end










@implementation UIControl (UIE)

@dynamic operation;

- (Class)operationClass {
    return UIControlOperation.class;
}

@end
