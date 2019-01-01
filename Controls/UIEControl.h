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

@end



@interface UIEControlOperation : UIEViewOperation <UIEControlDelegate>

@property (weak, readonly) UIControl *object;

@end
