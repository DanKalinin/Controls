//
//  UIEView.h
//  Controls
//
//  Created by Dan Kalinin on 12/30/18.
//

#import <UIKit/UIKit.h>
#import "UIEResponder.h"

@class UIEView;
@class UIEViewOperation;

@protocol UIEViewDelegate;










@interface UIView (UIE)

@property (readonly) UIEViewOperation *nseOperation;

@end










@interface UIEView : UIView

@end










@protocol UIEViewDelegate <UIEResponderDelegate>

@end



@interface UIEViewOperation : UIEResponderOperation <UIEViewDelegate>

@property (weak, readonly) UIView *object;

@end
