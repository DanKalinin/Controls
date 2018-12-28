//
//  UIControl.m
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import "UIControl.h"










@interface UIControlOperationInfo ()

@property UIEvent *event;

@end



@implementation UIControlOperationInfo

- (instancetype)initWithEvent:(UIEvent *)event {
    self = super.init;
    if (self) {
        self.event = event;
    }
    return self;
}

@end










@interface UIControlOperation ()

@property UIControlOperationInfo *info;

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
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationTouchDown:self];
}

- (void)uiControlEventTouchDownRepeat:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationTouchDownRepeat:self];
}

- (void)uiControlEventTouchDragInside:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationTouchDragInside:self];
}

- (void)uiControlEventTouchDragOutside:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationTouchDragOutside:self];
}

- (void)uiControlEventTouchDragEnter:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationTouchDragEnter:self];
}

- (void)uiControlEventTouchDragExit:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationTouchDragExit:self];
}

- (void)uiControlEventTouchUpInside:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationTouchUpInside:self];
}

- (void)uiControlEventTouchUpOutside:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationTouchUpOutside:self];
}

- (void)uiControlEventTouchCancel:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationTouchCancel:self];
}

- (void)uiControlEventValueChanged:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationValueChanged:self];
}

- (void)uiControlEventPrimaryActionTriggered:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationPrimaryActionTriggered:self];
}

- (void)uiControlEventEditingDidBegin:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEditingDidBegin:self];
}

- (void)uiControlEventEditingChanged:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEditingChanged:self];
}

- (void)uiControlEventEditingDidEnd:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEditingDidEnd:self];
}

- (void)uiControlEventEditingDidEndOnExit:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEditingDidEndOnExit:self];
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

- (void)uiControlOperationTouchDown:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationTouchDownRepeat:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationTouchDragInside:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationTouchDragOutside:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationTouchDragEnter:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationTouchDragExit:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationTouchUpInside:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationTouchUpOutside:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationTouchCancel:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationValueChanged:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationPrimaryActionTriggered:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationEditingDidBegin:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationEditingChanged:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationEditingDidEnd:(UIControlOperation *)operation {
    
}

- (void)uiControlOperationEditingDidEndOnExit:(UIControlOperation *)operation {
    
}

@end










@implementation UIControl (UIE)

@dynamic nseOperation;
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
