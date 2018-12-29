//
//  UIButton.h
//  Controls
//
//  Created by Dan Kalinin on 12/24/18.
//

#import <UIKit/UIKit.h>
#import "UIEControl.h"

@class UIButtonOperation;

@protocol UIButtonOperationDelegate;










@protocol UIButtonOperationDelegate <UIEControlOperationDelegate>

@optional
- (void)uiButtonOperationTouchUpInside:(UIButtonOperation *)operation;

@end



@interface UIButtonOperation : UIEControlOperation <UIButtonOperationDelegate>

@property (readonly) HLPArray<UIButtonOperationDelegate> *delegates;

@property (weak, readonly) UIButton *weakObject;

@end










@interface UIButton (UIE)

@property (readonly) UIButtonOperation *nseOperation;

@end
