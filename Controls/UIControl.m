//
//  UIControl.m
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import "UIControl.h"










@interface UIControlOperation ()

@end



@implementation UIControlOperation

@dynamic delegates;
@dynamic object;

- (instancetype)initWithObject:(UIControl *)object {
    self = [super initWithObject:object];
    if (self) {
        [self.object addTarget:self.delegates action:@selector(uiControlTouchDown:event:) forControlEvents:UIControlEventTouchDown];
        [self.object addTarget:self.delegates action:@selector(uiControlTouchDownRepeat:event:) forControlEvents:UIControlEventTouchDownRepeat];
        [self.object addTarget:self.delegates action:@selector(uiControlTouchDragInside:event:) forControlEvents:UIControlEventTouchDragInside];
        [self.object addTarget:self.delegates action:@selector(uiControlTouchDragOutside:event:) forControlEvents:UIControlEventTouchDragOutside];
        [self.object addTarget:self.delegates action:@selector(uiControlTouchDragEnter:event:) forControlEvents:UIControlEventTouchDragEnter];
        [self.object addTarget:self.delegates action:@selector(uiControlTouchDragExit:event:) forControlEvents:UIControlEventTouchDragExit];
        [self.object addTarget:self.delegates action:@selector(uiControlTouchUpInside:event:) forControlEvents:UIControlEventTouchUpInside];
        [self.object addTarget:self.delegates action:@selector(uiControlTouchUpOutside:event:) forControlEvents:UIControlEventTouchUpOutside];
        [self.object addTarget:self.delegates action:@selector(uiControlTouchCancel:event:) forControlEvents:UIControlEventTouchCancel];
        
        [self.object addTarget:self.delegates action:@selector(uiControlValueChanged:event:) forControlEvents:UIControlEventValueChanged];
        [self.object addTarget:self.delegates action:@selector(uiControlPrimaryActionTriggered:event:) forControlEvents:UIControlEventPrimaryActionTriggered];
        
        [self.object addTarget:self.delegates action:@selector(uiControlEditingDidBegin:event:) forControlEvents:UIControlEventEditingDidBegin];
        [self.object addTarget:self.delegates action:@selector(uiControlEditingChanged:event:) forControlEvents:UIControlEventEditingChanged];
        [self.object addTarget:self.delegates action:@selector(uiControlEditingDidEnd:event:) forControlEvents:UIControlEventEditingDidEnd];
        [self.object addTarget:self.delegates action:@selector(uiControlEditingDidEndOnExit:event:) forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    return self;
}

#pragma mark - Control

- (void)uiControl:(UIControl *)control setEnabled:(BOOL)enabled {
    if (self.object.enabled) {
        self.object.backgroundColor = self.object.uieDefaultBackgroundColor;
        self.object.uieLayerBorderColor = self.object.uieDefaultLayerBorderColor;
    } else {
        self.object.backgroundColor = self.object.uieDisabledBackgroundColor;
        self.object.uieLayerBorderColor = self.object.uieDisabledLayerBorderColor;
    }
}

- (void)uiControl:(UIControl *)control setSelected:(BOOL)selected {
    if (self.object.selected) {
        self.object.backgroundColor = self.object.uieSelectedBackgroundColor;
        self.object.uieLayerBorderColor = self.object.uieSelectedLayerBorderColor;
    } else {
        self.object.backgroundColor = self.object.uieDefaultBackgroundColor;
        self.object.uieLayerBorderColor = self.object.uieDefaultLayerBorderColor;
    }
}

- (void)uiControl:(UIControl *)control setHighlighted:(BOOL)highlighted {
    if (self.object.highlighted) {
        self.object.backgroundColor = self.object.uieHighlightedBackgroundColor;
        self.object.uieLayerBorderColor = self.object.uieHighlightedLayerBorderColor;
    } else {
        self.object.backgroundColor = self.object.uieDefaultBackgroundColor;
        self.object.uieLayerBorderColor = self.object.uieDefaultLayerBorderColor;
    }
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
