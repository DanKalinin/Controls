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
- (void)UIControlEventTouchDown:(UIEControl *)control;
- (void)UIControlEventTouchDownRepeat:(UIEControl *)control;
- (void)UIControlEventTouchDragInside:(UIEControl *)control;
- (void)UIControlEventTouchDragOutside:(UIEControl *)control;
- (void)UIControlEventTouchDragEnter:(UIEControl *)control;
- (void)UIControlEventTouchDragExit:(UIEControl *)control;
- (void)UIControlEventTouchUpInside:(UIEControl *)control;
- (void)UIControlEventTouchUpOutside:(UIEControl *)control;
- (void)UIControlEventTouchCancel:(UIEControl *)control;
- (void)UIControlEventValueChanged:(UIEControl *)control;
- (void)UIControlEventPrimaryActionTriggered:(UIEControl *)control;
- (void)UIControlEventEditingDidBegin:(UIEControl *)control;
- (void)UIControlEventEditingChanged:(UIEControl *)control;
- (void)UIControlEventEditingDidEnd:(UIEControl *)control;
- (void)UIControlEventEditingDidEndOnExit:(UIEControl *)control;

@end



@interface UIEControl : NSEOperation <UIEControlDelegate>

@property (readonly) HLPArray<UIEControlDelegate> *delegates;
@property (readonly) UIControl *control;
@property (readonly) UIEControlActionInfo *touchDownInfo;
@property (readonly) UIEControlActionInfo *touchDownRepeatInfo;

- (instancetype)initWithControl:(UIControl *)control;

@end
