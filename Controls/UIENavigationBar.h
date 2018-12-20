//
//  UIENavigationBar.h
//  Controls
//
//  Created by Dan Kalinin on 12/8/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class UIENavigationBar;
@class UIENavigationBarOperation;










@interface UIENavigationBar : UINavigationBar

@property (readonly) Class operationClass;
@property (readonly) UIENavigationBarOperation *operation;

@end










@protocol UIENavigationBarOperationDelegate <NSEOperationDelegate, UINavigationBarDelegate>

@end



@interface UIENavigationBarOperation : NSEOperation <UIENavigationBarOperationDelegate>

@property (readonly) HLPArray<UIENavigationBarOperationDelegate> *delegates;

@property (weak, readonly) UIENavigationBar *navigationBar;

- (instancetype)initWithNavigationBar:(UIENavigationBar *)navigationBar;

@end
