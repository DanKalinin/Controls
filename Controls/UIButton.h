//
//  UIButton.h
//  Controls
//
//  Created by Dan Kalinin on 12/24/18.
//

#import <UIKit/UIKit.h>
#import "UIControl.h"

@class UIButtonOperation;

@protocol UIButtonOperationDelegate;










@protocol UIButtonOperationDelegate <UIControlOperationDelegate>

@optional
- (void)UIButtonOperationEventTouchUpInside:(UIButtonOperation *)operation;

@end



@interface UIButtonOperation : UIControlOperation <UIButtonOperationDelegate>

@property (readonly) HLPArray<UIButtonOperationDelegate> *delegates;

@property (weak, readonly) UIButton *weakObject;

@end










@interface UIButton (UIE)

@property (readonly) UIButtonOperation *operation;

@end
