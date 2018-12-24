//
//  UIEControl.h
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import <UIKit/UIKit.h>
#import "UIControl.h"

@class UIEControl;
@class UIEControlOperation;

@protocol UIEControlOperationDelegate;










@interface UIEControl : UIControl

@property (readonly) Class operationClass;
@property (readonly) UIEControlOperation *operation;

@property IBInspectable UIColor *defaultBackgroundColor;
@property IBInspectable UIColor *highlightedBackgroundColor;
@property IBInspectable UIColor *selectedBackgroundColor;
@property IBInspectable UIColor *disabledBackgroundColor;

@property IBInspectable UIColor *defaultLayerBorderColor;
@property IBInspectable UIColor *highlightedLayerBorderColor;
@property IBInspectable UIColor *selectedLayerBorderColor;
@property IBInspectable UIColor *disabledLayerBorderColor;

@end










@protocol UIEControlOperationDelegate <UIControlOperationDelegate>

@end



@interface UIEControlOperation : UIControlOperation <UIEControlOperationDelegate>

@property (readonly) HLPArray<UIEControlOperationDelegate> *delegates;

@property (weak, readonly) UIEControl *weakObject;

@end
