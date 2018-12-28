//
//  UIControl.h
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import <UIKit/UIKit.h>
#import "UIView.h"

@class UIControlOperationInfo;
@class UIControlOperation;

@protocol UIControlOperationDelegate;










@interface UIControlOperationInfo : HLPObject

@property (readonly) UIEvent *event;

- (instancetype)initWithEvent:(UIEvent *)event;

@end










@protocol UIControlOperationDelegate <UIViewOperationDelegate>

@optional
- (void)uiControlOperationSetEnabled:(UIControlOperation *)operation;
- (void)uiControlOperationSetSelected:(UIControlOperation *)operation;
- (void)uiControlOperationSetHighlighted:(UIControlOperation *)operation;

- (void)uiControlOperationTouchDown:(UIControlOperation *)operation;
- (void)uiControlOperationTouchDownRepeat:(UIControlOperation *)operation;
- (void)uiControlOperationTouchDragInside:(UIControlOperation *)operation;
- (void)uiControlOperationTouchDragOutside:(UIControlOperation *)operation;
- (void)uiControlOperationTouchDragEnter:(UIControlOperation *)operation;
- (void)uiControlOperationTouchDragExit:(UIControlOperation *)operation;
- (void)uiControlOperationTouchUpInside:(UIControlOperation *)operation;
- (void)uiControlOperationTouchUpOutside:(UIControlOperation *)operation;
- (void)uiControlOperationTouchCancel:(UIControlOperation *)operation;

- (void)uiControlOperationValueChanged:(UIControlOperation *)operation;
- (void)uiControlOperationPrimaryActionTriggered:(UIControlOperation *)operation;

- (void)uiControlOperationEditingDidBegin:(UIControlOperation *)operation;
- (void)uiControlOperationEditingChanged:(UIControlOperation *)operation;
- (void)uiControlOperationEditingDidEnd:(UIControlOperation *)operation;
- (void)uiControlOperationEditingDidEndOnExit:(UIControlOperation *)operation;

@end



@interface UIControlOperation : UIViewOperation <UIControlOperationDelegate>

@property (readonly) HLPArray<UIControlOperationDelegate> *delegates;
@property (readonly) UIControlOperationInfo *info;

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
