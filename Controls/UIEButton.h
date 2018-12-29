//
//  UIEButton.h
//  Controls
//
//  Created by Dan Kalinin on 12/24/18.
//

#import <UIKit/UIKit.h>
#import "UIEControl.h"

@class UIEButtonOperation;
@class UIEButton;

@protocol UIEButtonOperationDelegate;










@protocol UIEButtonOperationDelegate <UIEControlOperationDelegate>

@optional
- (void)uieButtonTouchUpInside:(UIButton *)button event:(UIEvent *)event;

@end



@interface UIEButtonOperation : UIEControlOperation <UIEButtonOperationDelegate>

@property (readonly) HLPArray<UIEButtonOperationDelegate> *delegates;

@property (weak, readonly) UIButton *object;

@end










@interface UIButton (UIE)

@property (readonly) UIEButtonOperation *nseOperation;

@end










@interface UIEButton : UIButton

@end
