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
- (void)UIControlOperationDidSetEnabled:(UIControlOperation *)operation;
- (void)UIControlOperationDidSetSelected:(UIControlOperation *)operation;
- (void)UIControlOperationDidSetHighlighted:(UIControlOperation *)operation;

- (void)UIControlOperationEventTouchDown:(UIControlOperation *)operation;
- (void)UIControlOperationEventTouchDownRepeat:(UIControlOperation *)operation;
- (void)UIControlOperationEventTouchDragInside:(UIControlOperation *)operation;
- (void)UIControlOperationEventTouchDragOutside:(UIControlOperation *)operation;
- (void)UIControlOperationEventTouchDragEnter:(UIControlOperation *)operation;
- (void)UIControlOperationEventTouchDragExit:(UIControlOperation *)operation;
- (void)UIControlOperationEventTouchUpInside:(UIControlOperation *)operation;
- (void)UIControlOperationEventTouchUpOutside:(UIControlOperation *)operation;
- (void)UIControlOperationEventTouchCancel:(UIControlOperation *)operation;

- (void)UIControlOperationEventValueChanged:(UIControlOperation *)operation;
- (void)UIControlOperationEventPrimaryActionTriggered:(UIControlOperation *)operation;

- (void)UIControlOperationEventEditingDidBegin:(UIControlOperation *)operation;
- (void)UIControlOperationEventEditingChanged:(UIControlOperation *)operation;
- (void)UIControlOperationEventEditingDidEnd:(UIControlOperation *)operation;
- (void)UIControlOperationEventEditingDidEndOnExit:(UIControlOperation *)operation;

@end



@interface UIControlOperation : UIViewOperation <UIControlOperationDelegate>

@property (readonly) HLPArray<UIControlOperationDelegate> *delegates;
@property (readonly) UIControlOperationEventInfo *eventInfo;

@property (weak, readonly) UIControl *object;

@end










@interface UIControl (UIE)

@property (readonly) UIControlOperation *operation;

@property IBInspectable UIColor *defaultBackgroundColor;
@property IBInspectable UIColor *highlightedBackgroundColor;
@property IBInspectable UIColor *selectedBackgroundColor;
@property IBInspectable UIColor *disabledBackgroundColor;

@property IBInspectable UIColor *defaultLayerBorderColor;
@property IBInspectable UIColor *highlightedLayerBorderColor;
@property IBInspectable UIColor *selectedLayerBorderColor;
@property IBInspectable UIColor *disabledLayerBorderColor;

@end
