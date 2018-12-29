//
//  UIBarButtonItem.h
//  Controls
//
//  Created by Dan Kalinin on 12/25/18.
//

#import <UIKit/UIKit.h>
#import "UIBarItem.h"

@class UIBarButtonItemOperation;

@protocol UIBarButtonItemOperationDelegate;










@protocol UIBarButtonItemOperationDelegate <UIBarItemOperationDelegate>

@optional
- (void)uiBarButtonItemTouchUpInside:(UIBarButtonItem *)barButtonItem event:(UIEvent *)event;

@end



@interface UIBarButtonItemOperation : UIBarItemOperation <UIBarButtonItemOperationDelegate>

@property (readonly) HLPArray<UIBarButtonItemOperationDelegate> *delegates;

@property (weak, readonly) UIBarButtonItem *object;

@end










@interface UIBarButtonItem (UIE)

@property (readonly) UIBarButtonItemOperation *nseOperation;

@end
