//
//  UIEWindow.h
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import <UIKit/UIKit.h>
#import "UIEView.h"

@class UIEWindowOperation;
@class UIEKeyboardOperationInfo;
@class UIEKeyboardOperation;

@protocol UIEWindowOperationDelegate;
@protocol UIEKeyboardOperationDelegate;










@protocol UIEWindowOperationDelegate <UIEViewOperationDelegate>

@optional
- (void)uieWindowDidBecomeVisibleNotification:(NSNotification *)notification;
- (void)uieWindowDidBecomeHiddenNotification:(NSNotification *)notification;
- (void)uieWindowDidBecomeKeyNotification:(NSNotification *)notification;
- (void)uieWindowDidResignKeyNotification:(NSNotification *)notification;

@end



@interface UIEWindowOperation : UIEViewOperation <UIEWindowOperationDelegate>

@property (readonly) HLPArray<UIEWindowOperationDelegate> *delegates;

@property (weak, readonly) UIWindow *object;

@end










@interface UIWindow (UIE)

@property (readonly) UIEWindowOperation *nseOperation;

@end










@interface UIEWindow : UIWindow

@end










@interface UIEKeyboardOperationInfo : HLPObject

@property (readonly) NSDictionary *dictionary;
@property (readonly) CGRect frameBegin;
@property (readonly) CGRect frameEnd;
@property (readonly) NSTimeInterval animationDuration;
@property (readonly) UIViewAnimationCurve animationCurve;
@property (readonly) BOOL isLocal;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end










@protocol UIEKeyboardOperationDelegate <NSEOperationDelegate>

@optional
- (void)uieKeyboardWillShowNotification:(NSNotification *)notification;
- (void)uieKeyboardDidShowNotification:(NSNotification *)notification;
- (void)uieKeyboardWillHideNotification:(NSNotification *)notification;
- (void)uieKeyboardDidHideNotification:(NSNotification *)notification;
- (void)uieKeyboardWillChangeFrameNotification:(NSNotification *)notification;
- (void)uieKeyboardDidChangeFrameNotification:(NSNotification *)notification;

@end



@interface UIEKeyboardOperation : NSEOperation <UIEKeyboardOperationDelegate>

@property (readonly) HLPArray<UIEKeyboardOperationDelegate> *delegates;
@property (readonly) UIEKeyboardOperationInfo *info;

@end
