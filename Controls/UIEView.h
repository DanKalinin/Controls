//
//  UIEView.h
//  Controls
//
//  Created by Dan Kalinin on 12/20/18.
//

#import <UIKit/UIKit.h>
#import "UIResponder.h"

@class UIEViewOperation;
@class UIEView;

@protocol UIEViewOperationDelegate;










@protocol UIEViewOperationDelegate <UIResponderOperationDelegate>

@end



@interface UIEViewOperation : UIResponderOperation

@property (weak, readonly) UIView *object;

@end










@interface UIView (UIE)

@property (readonly) UIEViewOperation *nseOperation;

@property IBInspectable NSString *uieStringTag;
@property IBInspectable UIColor *uieLayerBorderColor;

@end










@interface UIEView : UIView

@end
