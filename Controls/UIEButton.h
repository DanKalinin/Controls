//
//  UIEButton.h
//  Controls
//
//  Created by Dan Kalinin on 11/29/18.
//

#import <UIKit/UIKit.h>
#import "UIButton.h"

@class UIEButton;
@class UIEButtonOperation;

@protocol UIEButtonOperationDelegate;










@interface UIEButton : UIButton

@property (readonly) Class operationClass;
@property (readonly) UIEButtonOperation *operation;

@property IBInspectable NSString *stringTag;

@property IBInspectable UIColor *defaultBackgroundColor;
@property IBInspectable UIColor *highlightedBackgroundColor;
@property IBInspectable UIColor *selectedBackgroundColor;
@property IBInspectable UIColor *disabledBackgroundColor;

@property IBInspectable UIColor *defaultLayerBorderColor;
@property IBInspectable UIColor *highlightedLayerBorderColor;
@property IBInspectable UIColor *selectedLayerBorderColor;
@property IBInspectable UIColor *disabledLayerBorderColor;

@property IBOutlet UIEButton *button1;

@end










@protocol UIEButtonOperationDelegate <UIButtonOperationDelegate>

@end



@interface UIEButtonOperation : UIButtonOperation <UIEButtonOperationDelegate>

@property (weak, readonly) UIEButton *weakObject;

@end
