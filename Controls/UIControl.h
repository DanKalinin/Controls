//
//  UIControl.h
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import <UIKit/UIKit.h>
#import "UIView.h"

@class UIControlOperation;

@protocol UIControlOperationDelegate;










@protocol UIControlOperationDelegate <UIViewOperationDelegate>

@optional
- (void)uiControl:(UIControl *)control setEnabled:(BOOL)enabled;
- (void)uiControl:(UIControl *)control setSelected:(BOOL)selected;
- (void)uiControl:(UIControl *)control setHighlighted:(BOOL)highlighted;

- (void)uiControlTouchDown:(UIControl *)control event:(UIEvent *)event;
- (void)uiControlTouchDownRepeat:(UIControl *)control event:(UIEvent *)event;
- (void)uiControlTouchDragInside:(UIControl *)control event:(UIEvent *)event;
- (void)uiControlTouchDragOutside:(UIControl *)control event:(UIEvent *)event;
- (void)uiControlTouchDragEnter:(UIControl *)control event:(UIEvent *)event;
- (void)uiControlTouchDragExit:(UIControl *)control event:(UIEvent *)event;
- (void)uiControlTouchUpInside:(UIControl *)control event:(UIEvent *)event;
- (void)uiControlTouchUpOutside:(UIControl *)control event:(UIEvent *)event;
- (void)uiControlTouchCancel:(UIControl *)control event:(UIEvent *)event;

- (void)uiControlValueChanged:(UIControl *)control event:(UIEvent *)event;
- (void)uiControlPrimaryActionTriggered:(UIControl *)control event:(UIEvent *)event;

- (void)uiControlEditingDidBegin:(UIControl *)control event:(UIEvent *)event;
- (void)uiControlEditingChanged:(UIControl *)control event:(UIEvent *)event;
- (void)uiControlEditingDidEnd:(UIControl *)control event:(UIEvent *)event;
- (void)uiControlEditingDidEndOnExit:(UIControl *)control event:(UIEvent *)event;

@end



@interface UIControlOperation : UIViewOperation <UIControlOperationDelegate>

@property (readonly) HLPArray<UIControlOperationDelegate> *delegates;

@property (weak, readonly) UIControl *object;

@end










@interface UIControl (UIE)

@property (readonly) UIControlOperation *nseOperation;

@property IBInspectable UIColor *uieDefaultBackgroundColor;
@property IBInspectable UIColor *uieHighlightedBackgroundColor;
@property IBInspectable UIColor *uieSelectedBackgroundColor;
@property IBInspectable UIColor *uieDisabledBackgroundColor;

@property IBInspectable UIColor *uieDefaultLayerBorderColor;
@property IBInspectable UIColor *uieHighlightedLayerBorderColor;
@property IBInspectable UIColor *uieSelectedLayerBorderColor;
@property IBInspectable UIColor *uieDisabledLayerBorderColor;

@end
