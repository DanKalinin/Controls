//
//  UIScrollView.h
//  Controls
//
//  Created by Dan Kalinin on 12/24/18.
//

#import <UIKit/UIKit.h>
#import "UIEView.h"

@class UIScrollViewOperation;

@protocol UIScrollViewOperationDelegate;










@protocol UIScrollViewOperationDelegate <UIEViewOperationDelegate, UIScrollViewDelegate>

@end



@interface UIScrollViewOperation : UIEViewOperation <UIScrollViewOperationDelegate>

@property (readonly) HLPArray<UIScrollViewOperationDelegate> *delegates;

@property (weak, readonly) UIScrollView *object;

@end










@interface UIScrollView (UIE)

@property (readonly) UIScrollViewOperation *nseOperation;

@end
