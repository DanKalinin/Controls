//
//  UIWindow.h
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import <UIKit/UIKit.h>
#import "UIView.h"

@class UIWindowOperation;

@protocol UIWindowOperationDelegate;



@protocol UIWindowOperationDelegate <UIViewOperationDelegate>

@optional
- (void)UIWindowOperationDidBecomeVisible:(UIWindowOperation *)operation;
- (void)UIWindowOperationDidBecomeHidden:(UIWindowOperation *)operation;
- (void)UIWindowOperationDidBecomeKey:(UIWindowOperation *)operation;
- (void)UIWindowOperationDidResignKey:(UIWindowOperation *)operation;

@end



@interface UIWindowOperation : UIViewOperation <UIWindowOperationDelegate>

@property (readonly) HLPArray<UIWindowOperationDelegate> *delegates;
@property (readonly) UIWindow *object;

@property (weak, readonly) UIWindow *weakObject;

@end
