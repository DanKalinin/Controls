//
//  UIScrollView.h
//  Controls
//
//  Created by Dan Kalinin on 12/24/18.
//

#import <UIKit/UIKit.h>
#import "UIView.h"



@protocol UIScrollViewOperationDelegate <UIViewOperationDelegate, UIScrollViewDelegate>

@end



@interface UIScrollViewOperation : UIViewOperation <UIScrollViewOperationDelegate>

@property (readonly) HLPArray<UIScrollViewOperationDelegate> *delegates;

@property (weak, readonly) UIScrollView *weakObject;

@end
