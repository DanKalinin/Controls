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
- (void)UITextFieldOperationEventEditingDidBegin:(UITextFieldOperation *)operation;
- (void)UITextFieldOperationEventEditingChanged:(UITextFieldOperation *)operation;
- (void)UITextFieldOperationEventEditingDidEnd:(UITextFieldOperation *)operation;
- (void)UITextFieldOperationEventEditingDidEndOnExit:(UITextFieldOperation *)operation;

- (void)UITextFieldOperationDidBeginEditing:(UITextFieldOperation *)operation;
- (void)UITextFieldOperationShouldChange:(UITextFieldOperation *)operation;
- (void)UITextFieldOperationShouldReturn:(UITextFieldOperation *)operation;

@end



@interface UITextFieldOperation : UIControlOperation <UITextFieldOperationDelegate>

@property (readonly) HLPArray<UITextFieldOperationDelegate> *delegates;
@property (readonly) UITextField *object;
@property (readonly) UITextFieldOperationShouldChangeInfo *shouldChangeInfo;
@property (readonly) UITextFieldOperationShouldReturnInfo *shouldReturnInfo;

@property (weak, readonly) UITextField *weakObject;

@end










@interface UITextField (UIE)

@property BOOL clearOnBegin;
@property NSString *pattern;

@end
