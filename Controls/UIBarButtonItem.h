//
//  UIBarButtonItem.h
//  Controls
//
//  Created by Dan Kalinin on 12/25/18.
//

#import <UIKit/UIKit.h>
#import "UIBarItem.h"

@class UIBarButtonItemOperationEventInfo;
@class UIBarButtonItemOperation;

@protocol UIBarButtonItemOperationDelegate;










@interface UIBarButtonItemOperationEventInfo : HLPObject

@property (readonly) UIEvent *event;

- (instancetype)initWithEvent:(UIEvent *)event;

@end










@protocol UIBarButtonItemOperationDelegate <UIBarItemOperationDelegate>

@optional
- (void)UIBarButtonItemOperationEventTouchUpInside:(UIBarButtonItemOperation *)operation;

@end



@interface UIBarButtonItemOperation : UIBarItemOperation <UIBarButtonItemOperationDelegate>

@property (readonly) HLPArray<UIBarButtonItemOperationDelegate> *delegates;
@property (readonly) UIBarButtonItemOperationEventInfo *eventInfo;

@property (weak, readonly) UIBarButtonItem *object;

@end










@interface UIBarButtonItem (UIE)

@property (readonly) UIBarButtonItemOperation *nseOperation;

@end
