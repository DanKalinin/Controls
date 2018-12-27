//
//  UIView.h
//  Controls
//
//  Created by Dan Kalinin on 12/20/18.
//

#import <UIKit/UIKit.h>
#import "UIResponder.h"

@class UIViewOperation;

@protocol UIViewOperationDelegate;










@protocol UIViewOperationDelegate <UIResponderOperationDelegate>

@end



@interface UIViewOperation : UIResponderOperation

@property (weak, readonly) UIView *object;

@end










@interface UIView (UIE)

@property (readonly) UIViewOperation *nseOperation;

@property IBInspectable NSString *stringTag;
@property IBInspectable UIColor *layerBorderColor;

@end
