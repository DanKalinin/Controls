//
//  UIEControl.h
//  Controls
//
//  Created by Dan Kalinin on 10/31/18.
//

#import <Helpers/Helpers.h>

@class UIEControl;



@protocol UIEControlDelegate <NSEOperationDelegate>

@optional
- (void)UIControlEventTouchDown:(UIEControl *)control;
- (void)UIControlEventTouchDownRepeat:(UIEControl *)control;
- (void)UIControlEventTouchDragInside:(UIEControl *)control;

@end



@interface UIEControl : NSEOperation <UIEControlDelegate>

@property (readonly) UIControl *control;

- (instancetype)initWithControl:(UIControl *)control;

@end
