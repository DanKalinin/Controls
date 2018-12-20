//
//  UIEButton.h
//  Controls
//
//  Created by Dan Kalinin on 11/29/18.
//

#import <UIKit/UIKit.h>
#import "UIView.h"

@class UIEButton;



@interface UIEButton : UIButton

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
