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

@property (readonly) UIView *object;

@property (weak, readonly) UIView *weakObject;

@end










@interface UIView (UIE)

@property IBInspectable UIColor *layerBorderColor;

@end
