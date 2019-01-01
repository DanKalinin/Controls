//
//  UIEControl.h
//  Controls
//
//  Created by Dan Kalinin on 1/1/19.
//

#import <UIKit/UIKit.h>
#import "UIEView.h"

@class UIEControl;
@class UIEControlOperation;

@protocol UIEControlDelegate;










@interface UIControl (UIE)

@property (readonly) UIEControlOperation *nseOperation;

@end










@interface UIEControl : UIControl

@end










@protocol UIEControlDelegate <UIEViewDelegate>

@optional
- (void)uieControlTouchDown:(UIControl *)control;
- (void)uieControlTouchDownRepeat:(UIControl *)control;
- (void)uieControlTouchDragInside:(UIControl *)control;
- (void)uieControlTouchDragOutside:(UIControl *)control;
- (void)uieControlTouchDragEnter:(UIControl *)control;
- (void)uieControlTouchDragExit:(UIControl *)control;
- (void)uieControlTouchUpInside:(UIControl *)control;
- (void)uieControlTouchUpOutside:(UIControl *)control;
- (void)uieControlTouchCancel:(UIControl *)control;

- (void)uieControlValueChanged:(UIControl *)control;
- (void)uieControlPrimaryActionTriggered:(UIControl *)control;

- (void)uieControlEditingDidBegin:(UIControl *)control;
- (void)uieControlEditingChanged:(UIControl *)control;
- (void)uieControlEditingDidEnd:(UIControl *)control;
- (void)uieControlEditingDidEndOnExit:(UIControl *)control;

@end



@interface UIEControlOperation : UIEViewOperation <UIEControlDelegate>

@property (readonly) HLPArray<UIEControlDelegate> *delegates;

@property (weak, readonly) UIControl *object;
@property (weak, readonly) UIEvent *event;

@end
