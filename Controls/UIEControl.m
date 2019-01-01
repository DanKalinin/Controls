//
//  UIEControl.m
//  Controls
//
//  Created by Dan Kalinin on 1/1/19.
//

#import "UIEControl.h"










@implementation UIControl (UIE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return UIEControlOperation.class;
}

@end










@interface UIEControl ()

@end



@implementation UIEControl

@end










@interface UIEControlOperation ()

@property (weak) UIEvent *event;

@end



@implementation UIEControlOperation

@dynamic delegates;
@dynamic object;

- (instancetype)initWithObject:(UIControl *)object {
    self = [super initWithObject:object];
    
    [object addTarget:self action:@selector(touchDown:event:) forControlEvents:UIControlEventTouchDown];
    [object addTarget:self action:@selector(touchDownRepeat:event:) forControlEvents:UIControlEventTouchDownRepeat];
    [object addTarget:self action:@selector(touchDragInside:event:) forControlEvents:UIControlEventTouchDragInside];
    [object addTarget:self action:@selector(touchDragOutside:event:) forControlEvents:UIControlEventTouchDragOutside];
    [object addTarget:self action:@selector(touchDragEnter:event:) forControlEvents:UIControlEventTouchDragEnter];
    [object addTarget:self action:@selector(touchDragExit:event:) forControlEvents:UIControlEventTouchDragExit];
    [object addTarget:self action:@selector(touchUpInside:event:) forControlEvents:UIControlEventTouchUpInside];
    [object addTarget:self action:@selector(touchUpOutside:event:) forControlEvents:UIControlEventTouchUpOutside];
    [object addTarget:self action:@selector(touchCancel:event:) forControlEvents:UIControlEventTouchCancel];

    [object addTarget:self action:@selector(valueChanged:event:) forControlEvents:UIControlEventValueChanged];
    [object addTarget:self action:@selector(primaryActionTriggered:event:) forControlEvents:UIControlEventPrimaryActionTriggered];
    
    [object addTarget:self action:@selector(editingDidBegin:event:) forControlEvents:UIControlEventEditingDidBegin];
    [object addTarget:self action:@selector(editingChanged:event:) forControlEvents:UIControlEventEditingChanged];
    [object addTarget:self action:@selector(editingDidEnd:event:) forControlEvents:UIControlEventEditingDidEnd];
    [object addTarget:self action:@selector(editingDidEndOnExit:event:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    return self;
}

- (void)touchDown:(UIControl *)sender event:(UIEvent *)event {
    self.event = event.nseAutorelease;
    [self.delegates uieControlTouchDown:sender];
}

- (void)touchDownRepeat:(UIControl *)sender event:(UIEvent *)event {
    self.event = event.nseAutorelease;
    [self.delegates uieControlTouchDownRepeat:sender];
}

- (void)touchDragInside:(UIControl *)sender event:(UIEvent *)event {
    self.event = event.nseAutorelease;
    [self.delegates uieControlTouchDragInside:sender];
}

- (void)touchDragOutside:(UIControl *)sender event:(UIEvent *)event {
    self.event = event.nseAutorelease;
    [self.delegates uieControlTouchDragOutside:sender];
}

- (void)touchDragEnter:(UIControl *)sender event:(UIEvent *)event {
    self.event = event.nseAutorelease;
    [self.delegates uieControlTouchDragEnter:sender];
}

- (void)touchDragExit:(UIControl *)sender event:(UIEvent *)event {
    self.event = event.nseAutorelease;
    [self.delegates uieControlTouchDragExit:sender];
}

- (void)touchUpInside:(UIControl *)sender event:(UIEvent *)event {
    self.event = event.nseAutorelease;
    [self.delegates uieControlTouchUpInside:sender];
}

- (void)touchUpOutside:(UIControl *)sender event:(UIEvent *)event {
    self.event = event.nseAutorelease;
    [self.delegates uieControlTouchUpOutside:sender];
}

- (void)touchCancel:(UIControl *)sender event:(UIEvent *)event {
    self.event = event.nseAutorelease;
    [self.delegates uieControlTouchCancel:sender];
}

- (void)valueChanged:(UIControl *)sender event:(UIEvent *)event {
    self.event = event.nseAutorelease;
    [self.delegates uieControlValueChanged:sender];
}

- (void)primaryActionTriggered:(UIControl *)sender event:(UIEvent *)event {
    self.event = event.nseAutorelease;
    [self.delegates uieControlPrimaryActionTriggered:sender];
}

- (void)editingDidBegin:(UIControl *)sender event:(UIEvent *)event {
    self.event = event.nseAutorelease;
    [self.delegates uieControlEditingDidBegin:sender];
}

- (void)editingChanged:(UIControl *)sender event:(UIEvent *)event {
    self.event = event.nseAutorelease;
    [self.delegates uieControlEditingChanged:sender];
}

- (void)editingDidEnd:(UIControl *)sender event:(UIEvent *)event {
    self.event = event.nseAutorelease;
    [self.delegates uieControlEditingDidEnd:sender];
}

- (void)editingDidEndOnExit:(UIControl *)sender event:(UIEvent *)event {
    self.event = event.nseAutorelease;
    [self.delegates uieControlEditingDidEndOnExit:sender];
}

@end
