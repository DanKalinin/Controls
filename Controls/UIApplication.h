//
//  UIApplication.h
//  Controls
//
//  Created by Dan Kalinin on 12/25/18.
//

#import <UIKit/UIKit.h>
#import "UIResponder.h"

@class UIApplicationOperation;

@protocol UIApplicationOperationDelegate;










@protocol UIApplicationOperationDelegate <UIResponderOperationDelegate, UIApplicationDelegate>

@end



@interface UIApplicationOperation : UIResponderOperation <UIApplicationOperationDelegate>

@property (nonatomic) UIWindow *window;

@property (readonly) HLPArray<UIApplicationOperationDelegate> *delegates;

@property (weak, readonly) UIApplication *object;

@end










@interface UIApplication (UIE)

@property (readonly) UIApplicationOperation *nseOperation;

@end
