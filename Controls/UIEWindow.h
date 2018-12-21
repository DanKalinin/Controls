//
//  UIEWindow.h
//  Controls
//
//  Created by Dan Kalinin on 12/21/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class UIEWindow;
@class UIEWindowOperation;
@class UIEKeyboardInfo;
@class UIEKeyboard;

@protocol UIEWindowOperationDelegate;
@protocol UIEKeyboardDelegate;










@interface UIEWindow : UIWindow

@property (readonly) Class operationClass;
@property (readonly) UIEWindowOperation *operation;

@end










@protocol UIEWindowOperationDelegate <NSEOperationDelegate>

@optional
- (void)UIEWindowOperationDidBecomeVisible:(UIEWindowOperation *)operation;
- (void)UIEWindowOperationDidBecomeHidden:(UIEWindowOperation *)operation;
- (void)UIEWindowOperationDidBecomeKey:(UIEWindowOperation *)operation;
- (void)UIEWindowOperationDidResignKey:(UIEWindowOperation *)operation;

@end



@interface UIEWindowOperation : NSEOperation <UIEWindowOperationDelegate>

@property (readonly) HLPArray<UIEWindowOperationDelegate> *delegates;

@property (weak, readonly) UIEWindow *window;

- (instancetype)initWithWindow:(UIEWindow *)window;

@end










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
