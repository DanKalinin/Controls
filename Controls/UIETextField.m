//
//  UIETextField.m
//  Controls
//
//  Created by Dan Kalinin on 1/2/19.
//

#import "UIETextField.h"










@implementation UITextField (UIE)

@dynamic nseOperation;
@dynamic uiePattern;
@dynamic uieClearOnBegin;

- (Class)nseOperationClass {
    return UIETextFieldOperation.class;
}

@end










@interface UIETextField ()

@property NSString *uiePattern;
@property BOOL uieClearOnBegin;

@end



@implementation UIETextField

@end










@interface UIETextFieldOperation ()

@end



@implementation UIETextFieldOperation

@dynamic object;

- (instancetype)initWithObject:(UITextField *)object {
    self = [super initWithObject:object];
    
    object.delegate = self;
    
    return self;
}

- (void)editingDidBegin:(UITextField *)sender event:(UIEvent *)event {
    [super editingDidBegin:sender event:event];
    
    [self.delegates uieControlEditingDidBegin:sender];
}

- (void)editingChanged:(UITextField *)sender event:(UIEvent *)event {
    [super editingChanged:sender event:event];
    
    [self.delegates uieControlEditingChanged:sender];
}

- (void)editingDidEnd:(UITextField *)sender event:(UIEvent *)event {
    [super editingDidEnd:sender event:event];
    
    [self.delegates uieControlEditingDidEnd:sender];
}

- (void)editingDidEndOnExit:(UITextField *)sender event:(UIEvent *)event {
    [super editingDidEndOnExit:sender event:event];
    
    [self.delegates uieControlEditingDidEndOnExit:sender];
}

#pragma mark - UITextFieldDelegate

@end
