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

@end



@implementation UIEControlOperation

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
    
}

- (void)touchDownRepeat:(UIControl *)sender event:(UIEvent *)event {
    
}

- (void)touchDragInside:(UIControl *)sender event:(UIEvent *)event {
    
}

- (void)touchDragOutside:(UIControl *)sender event:(UIEvent *)event {
    
}

- (void)touchDragEnter:(UIControl *)sender event:(UIEvent *)event {
    
}

- (void)touchDragExit:(UIControl *)sender event:(UIEvent *)event {
    
}

- (void)touchUpInside:(UIControl *)sender event:(UIEvent *)event {
    
}

- (void)touchUpOutside:(UIControl *)sender event:(UIEvent *)event {
    
}

- (void)touchCancel:(UIControl *)sender event:(UIEvent *)event {
    
}

- (void)valueChanged:(UIControl *)sender event:(UIEvent *)event {
    
}

- (void)primaryActionTriggered:(UIControl *)sender event:(UIEvent *)event {
    
}

- (void)editingDidBegin:(UIControl *)sender event:(UIEvent *)event {
    
}

- (void)editingChanged:(UIControl *)sender event:(UIEvent *)event {
    
}

- (void)editingDidEnd:(UIControl *)sender event:(UIEvent *)event {
    
}

- (void)editingDidEndOnExit:(UIControl *)sender event:(UIEvent *)event {
    
}

@end
