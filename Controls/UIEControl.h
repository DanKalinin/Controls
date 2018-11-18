//
//  UIEControl.h
//  Controls
//
//  Created by Dan Kalinin on 10/31/18.
//

#import <Helpers/Helpers.h>

@class UIEControlActionInfo;
@class UIEControl;










@interface UIEControlActionInfo : HLPObject

@property (readonly) UIEvent *event;

- (instancetype)initWithEvent:(UIEvent *)event;

@end










@protocol UIEControlDelegate <NSEOperationDelegate>

@optional
- (void)UIEControlEventTouchDown:(UIEControl *)control;
- (void)UIEControlEventTouchDownRepeat:(UIEControl *)control;
- (void)UIEControlEventTouchDragInside:(UIEControl *)control;
- (void)UIEControlEventTouchDragOutside:(UIEControl *)control;
- (void)UIEControlEventTouchDragEnter:(UIEControl *)control;
- (void)UIEControlEventTouchDragExit:(UIEControl *)control;
- (void)UIEControlEventTouchUpInside:(UIEControl *)control;
- (void)UIEControlEventTouchUpOutside:(UIEControl *)control;
- (void)UIEControlEventTouchCancel:(UIEControl *)control;
- (void)UIEControlEventValueChanged:(UIEControl *)control;
- (void)UIEControlEventPrimaryActionTriggered:(UIEControl *)control;
- (void)UIEControlEventEditingDidBegin:(UIEControl *)control;
- (void)UIEControlEventEditingChanged:(UIEControl *)control;
- (void)UIEControlEventEditingDidEnd:(UIEControl *)control;
- (void)UIEControlEventEditingDidEndOnExit:(UIEControl *)control;

@end



@interface UIEControl : NSEOperation <UIEControlDelegate>

@property (readonly) HLPArray<UIEControlDelegate> *delegates;
@property (readonly) UIControl *control;
@property (readonly) UIEControlActionInfo *actionInfo;

- (instancetype)initWithControl:(UIControl *)control;

@end
