//
//  UIControl.h
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import <UIKit/UIKit.h>
#import "UIEView.h"

@class UIEControlOperation;
@class UIEControl;

@protocol UIEControlOperationDelegate;










@protocol UIEControlOperationDelegate <UIEViewOperationDelegate>

@optional
- (void)uieControl:(UIControl *)control setEnabled:(BOOL)enabled;
- (void)uieControl:(UIControl *)control setSelected:(BOOL)selected;
- (void)uieControl:(UIControl *)control setHighlighted:(BOOL)highlighted;

- (void)uieControlTouchDown:(UIControl *)control event:(UIEvent *)event;
- (void)uieControlTouchDownRepeat:(UIControl *)control event:(UIEvent *)event;
- (void)uieControlTouchDragInside:(UIControl *)control event:(UIEvent *)event;
- (void)uieControlTouchDragOutside:(UIControl *)control event:(UIEvent *)event;
- (void)uieControlTouchDragEnter:(UIControl *)control event:(UIEvent *)event;
- (void)uieControlTouchDragExit:(UIControl *)control event:(UIEvent *)event;
- (void)uieControlTouchUpInside:(UIControl *)control event:(UIEvent *)event;
- (void)uieControlTouchUpOutside:(UIControl *)control event:(UIEvent *)event;
- (void)uieControlTouchCancel:(UIControl *)control event:(UIEvent *)event;

- (void)uieControlValueChanged:(UIControl *)control event:(UIEvent *)event;
- (void)uieControlPrimaryActionTriggered:(UIControl *)control event:(UIEvent *)event;

- (void)uieControlEditingDidBegin:(UIControl *)control event:(UIEvent *)event;
- (void)uieControlEditingChanged:(UIControl *)control event:(UIEvent *)event;
- (void)uieControlEditingDidEnd:(UIControl *)control event:(UIEvent *)event;
- (void)uieControlEditingDidEndOnExit:(UIControl *)control event:(UIEvent *)event;

@end



@interface UIEControlOperation : UIEViewOperation <UIEControlOperationDelegate>

@property UIColor *defaultBackgroundColor;
@property UIColor *highlightedBackgroundColor;
@property UIColor *selectedBackgroundColor;
@property UIColor *disabledBackgroundColor;

@property UIColor *defaultLayerBorderColor;
@property UIColor *highlightedLayerBorderColor;
@property UIColor *selectedLayerBorderColor;
@property UIColor *disabledLayerBorderColor;

@property (readonly) HLPArray<UIEControlOperationDelegate> *delegates;

@property (weak, readonly) UIControl *object;

@end










@interface UIControl (UIE)

@property (readonly) UIEControlOperation *nseOperation;

@end










@interface UIEControl : UIControl

@end
