//
//  UIEKeyboard.h
//  Controls
//
//  Created by Dan Kalinin on 7/7/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class UIEKeyboardInfo;
@class UIEKeyboard;










@interface UIEKeyboardInfo : HLPObject

@property (readonly) NSDictionary *dictionary;
@property (readonly) CGRect frameBegin;
@property (readonly) CGRect frameEnd;
@property (readonly) NSTimeInterval animationDuration;
@property (readonly) UIViewAnimationCurve animationCurve;
@property (readonly) BOOL isLocal;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end










@protocol UIEKeyboardDelegate <NSEOperationDelegate>

@optional
- (void)UIEKeyboardDidUpdateState:(UIEKeyboard *)keyboard;

- (void)UIEKeyboardDidBegin:(UIEKeyboard *)keyboard;
- (void)UIEKeyboardDidEnd:(UIEKeyboard *)keyboard;

- (void)UIEKeyboardWillShow:(UIEKeyboard *)keyboard;
- (void)UIEKeyboardDidShow:(UIEKeyboard *)keyboard;
- (void)UIEKeyboardWillHide:(UIEKeyboard *)keyboard;
- (void)UIEKeyboardDidHide:(UIEKeyboard *)keyboard;
- (void)UIEKeyboardWillChangeFrame:(UIEKeyboard *)keyboard;
- (void)UIEKeyboardDidChangeFrame:(UIEKeyboard *)keyboard;

@end



@interface UIEKeyboard : NSEOperation <UIEKeyboardDelegate>

@property (readonly) HLPArray<UIEKeyboardDelegate> *delegates;
@property (readonly) UIEKeyboardInfo *info;

@end
