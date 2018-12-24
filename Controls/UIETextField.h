//
//  UIETextField.h
//  Controls
//
//  Created by Dan Kalinin on 11/28/18.
//

#import <UIKit/UIKit.h>
#import "UITextField.h"

@class UIETextField;
@class UIETextFieldOperation;

@protocol UIETextFieldOperationDelegate;










@interface UIETextField : UITextField

@property (readonly) Class operationClass;
@property (readonly) UIETextFieldOperation *operation;

@property IBInspectable BOOL clearOnBegin;
@property IBInspectable NSString *pattern;

@end










@protocol UIETextFieldOperationDelegate <UITextFieldOperationDelegate>

@end



@interface UIETextFieldOperation : UITextFieldOperation <UIETextFieldOperationDelegate>

@property (readonly) HLPArray<UIETextFieldOperationDelegate> *delegates;

@property (weak, readonly) UIETextField *weakObject;

@end
