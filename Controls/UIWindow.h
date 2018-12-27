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
- (void)UIWindowOperationDidBecomeVisible:(UIWindowOperation *)operation;
- (void)UIWindowOperationDidBecomeHidden:(UIWindowOperation *)operation;
- (void)UIWindowOperationDidBecomeKey:(UIWindowOperation *)operation;
- (void)UIWindowOperationDidResignKey:(UIWindowOperation *)operation;

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
- (void)UIKeyboardOperationWillShow:(UIKeyboardOperation *)operation;
- (void)UIKeyboardOperationDidShow:(UIKeyboardOperation *)operation;
- (void)UIKeyboardOperationWillHide:(UIKeyboardOperation *)operation;
- (void)UIKeyboardOperationDidHide:(UIKeyboardOperation *)operation;
- (void)UIKeyboardOperationWillChangeFrame:(UIKeyboardOperation *)operation;
- (void)UIKeyboardOperationDidChangeFrame:(UIKeyboardOperation *)operation;

@end



@interface UIKeyboardOperation : NSEOperation <UIKeyboardOperationDelegate>

@property (readonly) HLPArray<UIKeyboardOperationDelegate> *delegates;
@property (readonly) UIKeyboardOperationInfo *info;

@end
