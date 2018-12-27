//
//  UIControl.h
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import <UIKit/UIKit.h>
#import "UIView.h"

@class UIControlOperationEventInfo;
@class UIControlOperation;

@protocol UIControlOperationDelegate;










@interface UIControlOperationEventInfo : HLPObject

@property (readonly) UIEvent *event;

- (instancetype)initWithEvent:(UIEvent *)event;

@end










@protocol UIControlOperationDelegate <UIViewOperationDelegate>

@optional
- (void)uiControlOperationDidSetEnabled:(UIControlOperation *)operation;
- (void)uiControlOperationDidSetSelected:(UIControlOperation *)operation;
- (void)uiControlOperationDidSetHighlighted:(UIControlOperation *)operation;

- (void)uiControlOperationEventTouchDown:(UIControlOperation *)operation;
- (void)uiControlOperationEventTouchDownRepeat:(UIControlOperation *)operation;
- (void)uiControlOperationEventTouchDragInside:(UIControlOperation *)operation;
- (void)uiControlOperationEventTouchDragOutside:(UIControlOperation *)operation;
- (void)uiControlOperationEventTouchDragEnter:(UIControlOperation *)operation;
- (void)uiControlOperationEventTouchDragExit:(UIControlOperation *)operation;
- (void)uiControlOperationEventTouchUpInside:(UIControlOperation *)operation;
- (void)uiControlOperationEventTouchUpOutside:(UIControlOperation *)operation;
- (void)uiControlOperationEventTouchCancel:(UIControlOperation *)operation;

- (void)uiControlOperationEventValueChanged:(UIControlOperation *)operation;
- (void)uiControlOperationEventPrimaryActionTriggered:(UIControlOperation *)operation;

- (void)uiControlOperationEventEditingDidBegin:(UIControlOperation *)operation;
- (void)uiControlOperationEventEditingChanged:(UIControlOperation *)operation;
- (void)uiControlOperationEventEditingDidEnd:(UIControlOperation *)operation;
- (void)uiControlOperationEventEditingDidEndOnExit:(UIControlOperation *)operation;

@end



@interface UIControlOperation : UIViewOperation <UIControlOperationDelegate>

@property (readonly) HLPArray<UIControlOperationDelegate> *delegates;
@property (readonly) UIControlOperationEventInfo *eventInfo;

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
