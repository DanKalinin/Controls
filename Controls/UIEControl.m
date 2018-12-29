//
//  UIControl.m
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import "UIEControl.h"










@interface UIEControlOperation ()

@end



@implementation UIEControlOperation

@dynamic delegates;
@dynamic object;

- (instancetype)initWithObject:(UIControl *)object {
    self = [super initWithObject:object];
    if (self) {
        [object addTarget:self.delegates action:@selector(uieControlTouchDown:event:) forControlEvents:UIControlEventTouchDown];
        [object addTarget:self.delegates action:@selector(uieControlTouchDownRepeat:event:) forControlEvents:UIControlEventTouchDownRepeat];
        [object addTarget:self.delegates action:@selector(uieControlTouchDragInside:event:) forControlEvents:UIControlEventTouchDragInside];
        [object addTarget:self.delegates action:@selector(uieControlTouchDragOutside:event:) forControlEvents:UIControlEventTouchDragOutside];
        [object addTarget:self.delegates action:@selector(uieControlTouchDragEnter:event:) forControlEvents:UIControlEventTouchDragEnter];
        [object addTarget:self.delegates action:@selector(uieControlTouchDragExit:event:) forControlEvents:UIControlEventTouchDragExit];
        [object addTarget:self.delegates action:@selector(uieControlTouchUpInside:event:) forControlEvents:UIControlEventTouchUpInside];
        [object addTarget:self.delegates action:@selector(uieControlTouchUpOutside:event:) forControlEvents:UIControlEventTouchUpOutside];
        [object addTarget:self.delegates action:@selector(uieControlTouchCancel:event:) forControlEvents:UIControlEventTouchCancel];
        
        [object addTarget:self.delegates action:@selector(uieControlValueChanged:event:) forControlEvents:UIControlEventValueChanged];
        [object addTarget:self.delegates action:@selector(uieControlPrimaryActionTriggered:event:) forControlEvents:UIControlEventPrimaryActionTriggered];
        
        [object addTarget:self.delegates action:@selector(uieControlEditingDidBegin:event:) forControlEvents:UIControlEventEditingDidBegin];
        [object addTarget:self.delegates action:@selector(uieControlEditingChanged:event:) forControlEvents:UIControlEventEditingChanged];
        [object addTarget:self.delegates action:@selector(uieControlEditingDidEnd:event:) forControlEvents:UIControlEventEditingDidEnd];
        [object addTarget:self.delegates action:@selector(uieControlEditingDidEndOnExit:event:) forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    return self;
}

#pragma mark - Control

- (void)uieControl:(UIControl *)control setEnabled:(BOOL)enabled {
    if (control.enabled) {
        control.backgroundColor = self.defaultBackgroundColor;
        control.nseOperation.layerBorderColor = self.defaultLayerBorderColor;
    } else {
        control.backgroundColor = self.disabledBackgroundColor;
        control.nseOperation.layerBorderColor = self.disabledLayerBorderColor;
    }
}

- (void)uieControl:(UIControl *)control setSelected:(BOOL)selected {
    if (control.selected) {
        control.backgroundColor = self.selectedBackgroundColor;
        control.nseOperation.layerBorderColor = self.selectedLayerBorderColor;
    } else {
        control.backgroundColor = self.defaultBackgroundColor;
        control.nseOperation.layerBorderColor = self.defaultLayerBorderColor;
    }
}

- (void)uieControl:(UIControl *)control setHighlighted:(BOOL)highlighted {
    if (control.highlighted) {
        control.backgroundColor = self.highlightedBackgroundColor;
        control.nseOperation.layerBorderColor = self.highlightedLayerBorderColor;
    } else {
        control.backgroundColor = self.defaultBackgroundColor;
        control.nseOperation.layerBorderColor = self.defaultLayerBorderColor;
    }
}

@end










@implementation UIControl (UIE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return UIEControlOperation.class;
}

@end










@interface UIEControl ()

@end



@implementation UIEControl

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    
    [self.nseOperation.delegates uieControl:self setEnabled:enabled];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    [self.nseOperation.delegates uieControl:self setSelected:selected];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    [self.nseOperation.delegates uieControl:self setHighlighted:highlighted];
}

@end
