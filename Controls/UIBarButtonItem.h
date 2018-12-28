//
//  UIBarButtonItem.h
//  Controls
//
//  Created by Dan Kalinin on 12/25/18.
//

#import <UIKit/UIKit.h>
#import "UIBarItem.h"

@class UIBarButtonItemOperationInfo;
@class UIBarButtonItemOperation;

@protocol UIBarButtonItemOperationDelegate;










@interface UIBarButtonItemOperationInfo : HLPObject

@property (readonly) UIEvent *event;

- (instancetype)initWithEvent:(UIEvent *)event;

@end










@protocol UIBarButtonItemOperationDelegate <UIBarItemOperationDelegate>

@optional
- (void)uiBarButtonItemOperationTouchUpInside:(UIBarButtonItemOperation *)operation;

@end



@interface UIBarButtonItemOperation : UIBarItemOperation <UIBarButtonItemOperationDelegate>

@property (readonly) HLPArray<UIBarButtonItemOperationDelegate> *delegates;
@property (readonly) UIBarButtonItemOperationInfo *info;

@property (weak, readonly) UIBarButtonItem *object;

@end










@interface UIBarButtonItem (UIE)

@property (readonly) UIBarButtonItemOperation *nseOperation;

@end
