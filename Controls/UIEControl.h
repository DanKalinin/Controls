//
//  UIEControl.h
//  Controls
//
//  Created by Dan Kalinin on 10/31/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class UIEControlActionInfo;
@class UIEControlManager;










@interface UIEControlActionInfo : HLPObject

@property (readonly) UIEvent *event;

- (instancetype)initWithEvent:(UIEvent *)event;

@end










@protocol UIEControlDelegate <NSEOperationDelegate>

@optional
- (void)UIEControlEventTouchDown:(UIEControlManager *)manager;
- (void)UIEControlEventTouchDownRepeat:(UIEControlManager *)manager;
- (void)UIEControlEventTouchDragInside:(UIEControlManager *)manager;
- (void)UIEControlEventTouchDragOutside:(UIEControlManager *)manager;
- (void)UIEControlEventTouchDragEnter:(UIEControlManager *)manager;
- (void)UIEControlEventTouchDragExit:(UIEControlManager *)manager;
- (void)UIEControlEventTouchUpInside:(UIEControlManager *)manager;
- (void)UIEControlEventTouchUpOutside:(UIEControlManager *)manager;
- (void)UIEControlEventTouchCancel:(UIEControlManager *)manager;
- (void)UIEControlEventValueChanged:(UIEControlManager *)manager;
- (void)UIEControlEventPrimaryActionTriggered:(UIEControlManager *)manager;
- (void)UIEControlEventEditingDidBegin:(UIEControlManager *)manager;
- (void)UIEControlEventEditingChanged:(UIEControlManager *)manager;
- (void)UIEControlEventEditingDidEnd:(UIEControlManager *)manager;
- (void)UIEControlEventEditingDidEndOnExit:(UIEControlManager *)manager;

@end



@interface UIEControlManager : NSEOperation <UIEControlDelegate>

@property (readonly) HLPArray<UIEControlDelegate> *delegates;
@property (readonly) UIEControlActionInfo *actionInfo;

@property (weak, readonly) UIControl *control;

- (instancetype)initWithControl:(UIControl *)control;

@end
