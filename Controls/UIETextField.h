//
//  UITextField.h
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import <UIKit/UIKit.h>
#import "UIEControl.h"

@class UIETextFieldOperation;
@class UIETextField;

@protocol UIETextFieldOperationDelegate;










@protocol UIETextFieldOperationDelegate <UIEControlOperationDelegate, UITextFieldDelegate>

@optional
- (void)uieTextFieldEditingDidBegin:(UITextField *)textField event:(UIEvent *)event;
- (void)uieTextFieldEditingChanged:(UITextField *)textField event:(UIEvent *)event;
- (void)uieTextFieldEditingDidEnd:(UITextField *)textField event:(UIEvent *)event;
- (void)uieTextFieldEditingDidEndOnExit:(UITextField *)textField event:(UIEvent *)event;

@end



@interface UIETextFieldOperation : UIEControlOperation <UIETextFieldOperationDelegate>

@property BOOL clearOnBegin;
@property NSString *pattern;

@property (readonly) HLPArray<UIETextFieldOperationDelegate> *delegates;

@property (weak, readonly) UITextField *object;

@end










@interface UITextField (UIE)

@property (readonly) UIETextFieldOperation *nseOperation;

@end










@interface UIETextField : UITextField

@end
