//
//  UIEApplication.h
//  Controls
//
//  Created by Dan Kalinin on 10/31/18.
//

#import <UIKit/UIKit.h>
#import "UIApplication.h"
#import "UIEWindow.h"

@class UIEApplication;
@class UIEApplicationOperation;

@protocol UIEApplicationOperationDelegate;










@interface UIEApplication : UIApplication

@property (readonly) Class operationClass;
@property (readonly) UIEApplicationOperation *operation;

@end










@protocol UIEApplicationOperationDelegate <UIApplicationOperationDelegate>

@end



@interface UIEApplicationOperation : UIApplicationOperation <UIEApplicationOperationDelegate>

@property (readonly) HLPArray<UIEApplicationOperationDelegate> *delegates;

@end
