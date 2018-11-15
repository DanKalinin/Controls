//
//  UIEApplication.h
//  Controls
//
//  Created by Dan Kalinin on 10/31/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class UIEApplication;
@class UIEApplicationPrincipal;










@protocol UIEApplicationDelegate <NSEOperationDelegate, UIApplicationDelegate>

@end



@interface UIEApplication : NSEOperation <UIEApplicationDelegate>

@property (nonatomic) UIWindow *window;

@property (readonly) HLPArray<UIEApplicationDelegate> *delegates;
@property (readonly) UIApplication *application;

- (int)main:(int)argc argv:(char **)argv;

@end










@interface UIEApplicationPrincipal : UIApplication

@end
