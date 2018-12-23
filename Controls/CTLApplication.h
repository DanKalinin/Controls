//
//  CTLApplication.h
//  Controls
//
//  Created by Dan Kalinin on 6/6/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>
#import "UIEWindow.h"

@class CTLApplication;



@protocol CTLApplicationDelegate <UIKeyboardOperationDelegate, UIApplicationDelegate>

@end



@interface CTLApplication : UIApplication <CTLApplicationDelegate>

@property (nonatomic) UIWindow *window;

@property (readonly) NSOperationQueue *operationQueue;
@property (readonly) HLPArray<CTLApplicationDelegate> *delegates;
@property (readonly) UIKeyboardOperation *keyboard;

+ (instancetype)shared;

- (void)addOperation:(HLPOperation *)operation;

@end
