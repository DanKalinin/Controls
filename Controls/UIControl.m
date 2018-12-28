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
        [self.object addTarget:self action:@selector(uiControlTouchDown:event:) forControlEvents:UIControlEventTouchDown];
        [self.object addTarget:self action:@selector(uiControlTouchDownRepeat:event:) forControlEvents:UIControlEventTouchDownRepeat];
        [self.object addTarget:self action:@selector(uiControlTouchDragInside:event:) forControlEvents:UIControlEventTouchDragInside];
        [self.object addTarget:self action:@selector(uiControlTouchDragOutside:event:) forControlEvents:UIControlEventTouchDragOutside];
        [self.object addTarget:self action:@selector(uiControlTouchDragEnter:event:) forControlEvents:UIControlEventTouchDragEnter];
        [self.object addTarget:self action:@selector(uiControlTouchDragExit:event:) forControlEvents:UIControlEventTouchDragExit];
        [self.object addTarget:self action:@selector(uiControlTouchUpInside:event:) forControlEvents:UIControlEventTouchUpInside];
        [self.object addTarget:self action:@selector(uiControlTouchUpOutside:event:) forControlEvents:UIControlEventTouchUpOutside];
        [self.object addTarget:self action:@selector(uiControlTouchCancel:event:) forControlEvents:UIControlEventTouchCancel];
        
        [self.object addTarget:self action:@selector(uiControlValueChanged:event:) forControlEvents:UIControlEventValueChanged];
        [self.object addTarget:self action:@selector(uiControlPrimaryActionTriggered:event:) forControlEvents:UIControlEventPrimaryActionTriggered];
        
        [self.object addTarget:self action:@selector(uiControlEditingDidBegin:event:) forControlEvents:UIControlEventEditingDidBegin];
        [self.object addTarget:self action:@selector(uiControlEditingChanged:event:) forControlEvents:UIControlEventEditingChanged];
        [self.object addTarget:self action:@selector(uiControlEditingDidEnd:event:) forControlEvents:UIControlEventEditingDidEnd];
        [self.object addTarget:self action:@selector(uiControlEditingDidEndOnExit:event:) forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    return self;
}

#pragma mark - Control

- (void)uiControlTouchDown:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationTouchDown:self];
}

- (void)uiControlTouchDownRepeat:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationTouchDownRepeat:self];
}

- (void)uiControlTouchDragInside:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationTouchDragInside:self];
}

- (void)uiControlTouchDragOutside:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationTouchDragOutside:self];
}

- (void)uiControlTouchDragEnter:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationTouchDragEnter:self];
}

- (void)uiControlTouchDragExit:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationTouchDragExit:self];
}

- (void)uiControlTouchUpInside:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationTouchUpInside:self];
}

- (void)uiControlTouchUpOutside:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationTouchUpOutside:self];
}

- (void)uiControlTouchCancel:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationTouchCancel:self];
}

- (void)uiControlValueChanged:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationValueChanged:self];
}

- (void)uiControlPrimaryActionTriggered:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationPrimaryActionTriggered:self];
}

- (void)uiControlEditingDidBegin:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEditingDidBegin:self];
}

- (void)uiControlEditingChanged:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEditingChanged:self];
}

- (void)uiControlEditingDidEnd:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEditingDidEnd:self];
}

- (void)uiControlEditingDidEndOnExit:(UIControl *)control event:(UIEvent *)event {
    self.info = [UIControlOperationInfo.alloc initWithEvent:event];
    [self.delegates uiControlOperationEditingDidEndOnExit:self];
}

#pragma mark - Control operation

- (void)uiControlOperationSetEnabled:(UIControlOperation *)operation {
    if (self.object.enabled) {
        self.object.backgroundColor = self.object.uieDefaultBackgroundColor;
        self.object.uieLayerBorderColor = self.object.uieDefaultLayerBorderColor;
    } else {
        self.object.backgroundColor = self.object.uieDisabledBackgroundColor;
        self.object.uieLayerBorderColor = self.object.uieDisabledLayerBorderColor;
    }
}

- (void)uiControlOperationSetSelected:(UIControlOperation *)operation {
    if (self.object.selected) {
        self.object.backgroundColor = self.object.uieSelectedBackgroundColor;
        self.object.uieLayerBorderColor = self.object.uieSelectedLayerBorderColor;
    } else {
        self.object.backgroundColor = self.object.uieDefaultBackgroundColor;
        self.object.uieLayerBorderColor = self.object.uieDefaultLayerBorderColor;
    }
}

- (void)uiControlOperationSetHighlighted:(UIControlOperation *)operation {
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
