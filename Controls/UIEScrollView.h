//
//  UIEScrollView.h
//  Controls
//
//  Created by Dan Kalinin on 12/24/18.
//

#import <UIKit/UIKit.h>
#import "UIEView.h"

@class UIEScrollViewOperation;

@protocol UIEScrollViewOperationDelegate;










@protocol UIEScrollViewOperationDelegate <UIEViewOperationDelegate, UIScrollViewDelegate>

@end



@interface UIEScrollViewOperation : UIEViewOperation <UIEScrollViewOperationDelegate>

@property (readonly) HLPArray<UIEScrollViewOperationDelegate> *delegates;

@property (weak, readonly) UIScrollView *object;

@end










@interface UIScrollView (UIE)

@property (readonly) UIEScrollViewOperation *nseOperation;

@end










@interface UIEScrollView : UIScrollView

@end
