//
//  UIETextField.h
//  Controls
//
//  Created by Dan Kalinin on 1/2/19.
//

#import <UIKit/UIKit.h>
#import "UIEControl.h"

@class UIETextField;
@class UIETextFieldOperation;

@protocol UIETextFieldDelegate;










@interface UITextField (UIE)

@property (readonly) UIETextFieldOperation *nseOperation;

@property IBInspectable NSString *uiePattern;
@property IBInspectable BOOL uieClearOnBegin;

@end










@interface UIETextField : UITextField

@end










@protocol UIETextFieldDelegate <UIEControlDelegate>

@optional
- (void)uieTextFieldEditingDidBegin:(UITextField *)textField;
- (void)uieTextFieldEditingChanged:(UITextField *)textField;
- (void)uieTextFieldEditingDidEnd:(UITextField *)textField;
- (void)uieTextFieldEditingDidEndOnExit:(UITextField *)textField;

@end



@interface UIETextFieldOperation : UIEControlOperation <UIETextFieldDelegate, UITextFieldDelegate>

@property (weak, readonly) UITextField *object;

@end
