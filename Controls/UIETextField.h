//
//  UIETextField.h
//  Controls
//
//  Created by Dan Kalinin on 11/28/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class UIETextField;
@class UIETextFieldOperationShouldReturnInfo;
@class UIETextFieldOperationShouldChangeCharactersInfo;
@class UIETextFieldOperation;










@interface UIETextField : UITextField

@property (readonly) Class operationClass;
@property (readonly) UIETextFieldOperation *operation;

@property IBInspectable BOOL clearOnBegin;
@property IBInspectable NSString *pattern;

@end










@interface UIETextFieldOperationShouldChangeCharactersInfo : HLPObject

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
- (void)UIETextFieldOperationShouldChangeCharacters:(UIETextFieldOperation *)operation;
- (void)UIETextFieldOperationShouldReturn:(UIETextFieldOperation *)operation;

@end



@interface UIETextFieldOperation : NSEOperation <UIETextFieldOperationDelegate>

@property (readonly) HLPArray<UIETextFieldOperationDelegate> *delegates;
@property (readonly) UIETextFieldOperationShouldChangeCharactersInfo *shouldChangeCharactersInfo;
@property (readonly) UIETextFieldOperationShouldReturnInfo *shouldReturnInfo;

@property (weak, readonly) UIETextField *textField;

- (instancetype)initWithTextField:(UIETextField *)textField;

@end
