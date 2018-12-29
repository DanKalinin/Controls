//
//  UIWindow.h
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import <UIKit/UIKit.h>
#import "UIView.h"

@class UIWindowOperation;
@class UIKeyboardOperationInfo;
@class UIKeyboardOperation;

@protocol UIWindowOperationDelegate;
@protocol UIKeyboardOperationDelegate;










@protocol UIWindowOperationDelegate <UIViewOperationDelegate>

@optional
- (void)uiWindowDidBecomeVisibleNotification:(NSNotification *)notification;
- (void)uiWindowDidBecomeHiddenNotification:(NSNotification *)notification;
- (void)uiWindowDidBecomeKeyNotification:(NSNotification *)notification;
- (void)uiWindowDidResignKeyNotification:(NSNotification *)notification;

@end



@interface UIWindowOperation : UIViewOperation <UIWindowOperationDelegate>

@property (readonly) HLPArray<UIWindowOperationDelegate> *delegates;

@property (weak, readonly) UIWindow *object;

@end










@interface UIWindow (UIE)

@property (readonly) UIWindowOperation *nseOperation;

@end










@interface UIKeyboardOperationInfo : HLPObject

@property (readonly) NSDictionary *dictionary;
@property (readonly) CGRect frameBegin;
@property (readonly) CGRect frameEnd;
@property (readonly) NSTimeInterval animationDuration;
@property (readonly) UIViewAnimationCurve animationCurve;
@property (readonly) BOOL isLocal;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end










@protocol UIKeyboardOperationDelegate <NSEOperationDelegate>

@optional
- (void)uiKeyboardWillShowNotification:(NSNotification *)notification;
- (void)uiKeyboardDidShowNotification:(NSNotification *)notification;
- (void)uiKeyboardWillHideNotification:(NSNotification *)notification;
- (void)uiKeyboardDidHideNotification:(NSNotification *)notification;
- (void)uiKeyboardWillChangeFrameNotification:(NSNotification *)notification;
- (void)uiKeyboardDidChangeFrameNotification:(NSNotification *)notification;

@end



@interface UIKeyboardOperation : NSEOperation <UIKeyboardOperationDelegate>

@property (readonly) HLPArray<UIKeyboardOperationDelegate> *delegates;
@property (readonly) UIKeyboardOperationInfo *info;

@end
