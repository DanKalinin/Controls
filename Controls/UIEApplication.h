//
//  UIEApplication.h
//  Controls
//
//  Created by Dan Kalinin on 10/31/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>
#import "UIEWindow.h"

@class UIEApplication;
@class UIEApplicationOperation;

@protocol UIEApplicationOperationDelegate;










@interface UIEApplication : UIApplication

@property (readonly) Class operationClass;
@property (readonly) UIEApplicationOperation *operation;

@end










@protocol UIEApplicationOperationDelegate <NSEOperationDelegate, UIApplicationDelegate>

@end



@interface UIEApplicationOperation : NSEOperation <UIEApplicationOperationDelegate>

@property (nonatomic) UIEWindow *window;

@property (readonly) HLPArray<UIEApplicationOperationDelegate> *delegates;

@property (weak, readonly) UIEApplication *application;

- (instancetype)initWithApplication:(UIEApplication *)application;

@end
