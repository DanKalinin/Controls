//
//  UIEWindow.h
//  Controls
//
//  Created by Dan Kalinin on 12/21/18.
//

#import <UIKit/UIKit.h>
#import "UIWindow.h"

@class UIEWindow;
@class UIEWindowOperation;

@protocol UIEWindowOperationDelegate;
@protocol UIEKeyboardDelegate;










@interface UIEWindow : UIWindow

@property (readonly) Class operationClass;
@property (readonly) UIEWindowOperation *operation;

@end










@protocol UIEWindowOperationDelegate <UIWindowOperationDelegate>

@end



@interface UIEWindowOperation : UIWindowOperation <UIEWindowOperationDelegate>

@property (readonly) HLPArray<UIEWindowOperationDelegate> *delegates;

@property (weak, readonly) UIEWindow *weakObject;

@end
