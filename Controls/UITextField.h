//
//  UITextField.h
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import <UIKit/UIKit.h>
#import "UIControl.h"

@class UITextFieldOperationShouldChangeInfo;
@class UITextFieldOperationShouldReturnInfo;
@class UITextFieldOperation;

@protocol UITextFieldOperationDelegate;










@interface UITextFieldOperationShouldChangeInfo : HLPObject

@property BOOL shouldChange;

@property (readonly) NSRange range;
@property (readonly) NSString *string;

- (instancetype)initWithRange:(NSRange)range string:(NSString *)string;

@end










@interface UITextFieldOperationShouldReturnInfo : HLPObject

@property BOOL shouldReturn;

@end










@protocol UITextFieldOperationDelegate <UIControlOperationDelegate, UITextFieldDelegate>

@optional
- (void)uiTextFieldOperationEditingDidBegin:(UITextFieldOperation *)operation;
- (void)uiTextFieldOperationEditingChanged:(UITextFieldOperation *)operation;
- (void)uiTextFieldOperationEditingDidEnd:(UITextFieldOperation *)operation;
- (void)uiTextFieldOperationEditingDidEndOnExit:(UITextFieldOperation *)operation;

- (void)uiTextFieldOperationDidBeginEditing:(UITextFieldOperation *)operation;
- (void)uiTextFieldOperationShouldChange:(UITextFieldOperation *)operation;
- (void)uiTextFieldOperationShouldReturn:(UITextFieldOperation *)operation;

@end



@interface UITextFieldOperation : UIControlOperation <UITextFieldOperationDelegate>

@property (readonly) HLPArray<UITextFieldOperationDelegate> *delegates;
@property (readonly) UITextFieldOperationShouldChangeInfo *shouldChangeInfo;
@property (readonly) UITextFieldOperationShouldReturnInfo *shouldReturnInfo;

@property (weak, readonly) UITextField *object;

@end










@interface UITextField (UIE)

@property (readonly) UITextFieldOperation *nseOperation;

@property IBInspectable BOOL uieClearOnBegin;
@property IBInspectable NSString *uiePattern;

@end
