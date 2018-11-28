//
//  UIETextField.h
//  Controls
//
//  Created by Dan Kalinin on 11/28/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class UIETextField;
@class UIETextFieldOperation;










@interface UIETextField : UITextField

@property (readonly) Class operationClass;
@property (readonly) UIETextFieldOperation *operation;

@property IBInspectable BOOL clearOnBegin;
@property IBInspectable NSString *pattern;

@end










@protocol UIETextFieldOperationDelegate <NSEOperationDelegate, UITextFieldDelegate>

@end



@interface UIETextFieldOperation : NSEOperation <UIETextFieldOperationDelegate>

@property (readonly) HLPArray<UIETextFieldOperationDelegate> *delegates;

@property (weak, readonly) UIETextField *textField;

- (instancetype)initWithTextField:(UIETextField *)textField;

@end
