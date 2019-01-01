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

    
    
    
//    UIControlEventValueChanged                                      = 1 << 12,     // sliders, etc.
//    UIControlEventPrimaryActionTriggered NS_ENUM_AVAILABLE_IOS(9_0) = 1 << 13,     // semantic action: for buttons, etc.
//
//    UIControlEventEditingDidBegin                                   = 1 << 16,     // UITextField
//    UIControlEventEditingChanged                                    = 1 << 17,
//    UIControlEventEditingDidEnd                                     = 1 << 18,
//    UIControlEventEditingDidEndOnExit
    
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

- (void)touchUpOutside:(UIControl *)control event:(UIEvent *)event {
    
}

- (void)touchCancel:(UIControl *)control event:(UIEvent *)event {
    
}

@end
