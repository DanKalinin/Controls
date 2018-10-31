//
//  UIEApplication.h
//  Controls
//
//  Created by Dan Kalinin on 10/31/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>



@protocol UIEApplicationDelegate <NSEOperationDelegate, UIApplicationDelegate>

@end



@interface UIEApplication : NSEOperation <UIEApplicationDelegate>

@property (nonatomic) UIWindow *window;

@property (readonly) HLPArray<UIEApplicationDelegate> *delegates;
@property (readonly) UIApplication *application;

@end
