//
//  UIETextField.h
//  Controls
//
//  Created by Dan Kalinin on 11/28/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class UIETextField;
@class UIETextFieldOperationShouldChangeInfo;
@class UIETextFieldOperationShouldReturnInfo;
@class UIETextFieldOperation;

@protocol UIETextFieldOperationDelegate;










@interface UIETextField : UITextField

@property (readonly) Class operationClass;
@property (readonly) UIETextFieldOperation *operation;

@property IBInspectable BOOL clearOnBegin;
@property IBInspectable NSString *pattern;

@end










@interface UIETextFieldOperationShouldChangeInfo : HLPObject

@property BOOL shouldChange;

@property (readonly) NSRange range;
@property (readonly) NSString *string;

- (instancetype)initWithRange:(NSRange)range string:(NSString *)string;

@end










@interface UIETextFieldOperationShouldReturnInfo : HLPObject

@property BOOL shouldReturn;

@end










@protocol UIETextFieldOperationDelegate <NSEOperationDelegate, UITextFieldDelegate>

@optional
- (void)UIETextFieldOperationShouldChange:(UIETextFieldOperation *)operation;
- (void)UIETextFieldOperationShouldReturn:(UIETextFieldOperation *)operation;

@end



@interface UIETextFieldOperation : NSEOperation <UIETextFieldOperationDelegate>

@property (readonly) HLPArray<UIETextFieldOperationDelegate> *delegates;
@property (readonly) UIETextFieldOperationShouldChangeInfo *shouldChangeInfo;
@property (readonly) UIETextFieldOperationShouldReturnInfo *shouldReturnInfo;

@property (weak, readonly) UIETextField *textField;

- (instancetype)initWithTextField:(UIETextField *)textField;

@end
