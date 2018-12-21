//
//  UIEWindow.h
//  Controls
//
//  Created by Dan Kalinin on 12/21/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class UIEWindow;
@class UIEWindowOperation;

@protocol UIEWindowOperationDelegate;










@interface UIEWindow : UIWindow

@property (readonly) Class operationClass;
@property (readonly) UIEWindowOperation *operation;

@end










@protocol UIEWindowOperationDelegate <NSEOperationDelegate>

@end



@interface UIEWindowOperation : NSEOperation <UIEWindowOperationDelegate>

@property (weak, readonly) UIEWindow *window;

- (instancetype)initWithWindow:(UIEWindow *)window;

@end
