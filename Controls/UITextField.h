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
- (void)UITextFieldOperationShouldChangeCharacters:(UITextFieldOperation *)operation;
- (void)UITextFieldOperationShouldReturn:(UITextFieldOperation *)operation;

@end



@interface UITextFieldOperation : UIControlOperation <UITextFieldOperationDelegate>

@property (readonly) HLPArray<UITextFieldOperationDelegate> *delegates;
@property (readonly) UITextField *object;

@property (weak, readonly) UITextField *weakObject;

@end
