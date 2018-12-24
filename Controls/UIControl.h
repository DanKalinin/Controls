//
//  UIControl.h
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import <UIKit/UIKit.h>
#import "UIView.h"

@class UIControlOperation;

@protocol UIControlOperationDelegate;










@protocol UIControlOperationDelegate <UIViewOperationDelegate>

@optional
- (void)UIControlOperationDidSetEnabled:(UIControlOperation *)operation;
- (void)UIControlOperationDidSetSelected:(UIControlOperation *)operation;
- (void)UIControlOperationDidSetHighlighted:(UIControlOperation *)operation;

@end



@interface UIControlOperation : UIViewOperation <UIControlOperationDelegate>

@property (readonly) UIControl *object;

@property (weak, readonly) UIControl *weakObject;

@end










@interface UIControl (UIE)

@property IBInspectable UIColor *defaultBackgroundColor;
@property IBInspectable UIColor *highlightedBackgroundColor;
@property IBInspectable UIColor *selectedBackgroundColor;
@property IBInspectable UIColor *disabledBackgroundColor;

@property IBInspectable UIColor *defaultLayerBorderColor;
@property IBInspectable UIColor *highlightedLayerBorderColor;
@property IBInspectable UIColor *selectedLayerBorderColor;
@property IBInspectable UIColor *disabledLayerBorderColor;

@end
