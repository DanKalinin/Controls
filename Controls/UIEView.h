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

@property NSString *stringTag;
@property UIColor *layerBorderColor;

@property (weak, readonly) UIView *object;

@end










@interface UIView (UIE)

@property (readonly) UIEViewOperation *nseOperation;

@end










@interface UIEView : UIView

@end
