//
//  UITextField.h
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import <UIKit/UIKit.h>
#import "UIControl.h"

@class UITextFieldOperation;

@protocol UITextFieldOperationDelegate;










@protocol UITextFieldOperationDelegate <UIControlOperationDelegate, UITextFieldDelegate>

@optional
- (void)uiTextFieldEditingDidBegin:(UITextField *)textField event:(UIEvent *)event;
- (void)uiTextFieldEditingChanged:(UITextField *)textField event:(UIEvent *)event;
- (void)uiTextFieldEditingDidEnd:(UITextField *)textField event:(UIEvent *)event;
- (void)uiTextFieldEditingDidEndOnExit:(UITextField *)textField event:(UIEvent *)event;

@end



@interface UITextFieldOperation : UIControlOperation <UITextFieldOperationDelegate>

@property (readonly) HLPArray<UITextFieldOperationDelegate> *delegates;

@property (weak, readonly) UITextField *object;

@end










@interface UITextField (UIE)

@property (readonly) UITextFieldOperation *nseOperation;

@property IBInspectable BOOL uieClearOnBegin;
@property IBInspectable NSString *uiePattern;

@end
