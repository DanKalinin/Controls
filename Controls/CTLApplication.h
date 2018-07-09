//
//  CTLApplication.h
//  Controls
//
//  Created by Dan Kalinin on 6/6/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>
#import "CTLKeyboard.h"

@class CTLApplication;



@protocol CTLApplicationDelegate <CTLKeyboardDelegate, UIApplicationDelegate>

@end



@interface CTLApplication : UIApplication <CTLApplicationDelegate>

@property (nonatomic) UIWindow *window;

@property (readonly) NSOperationQueue *operationQueue;
@property (readonly) HLPArray<CTLApplicationDelegate> *delegates;
@property (readonly) CTLKeyboard *keyboard;

+ (instancetype)shared;

- (void)addOperation:(HLPOperation *)operation;

@end
