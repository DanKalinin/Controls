//
//  UIEButton.h
//  Controls
//
//  Created by Dan Kalinin on 11/29/18.
//

#import <UIKit/UIKit.h>
#import "UIButton.h"

@class UIEButton;



@interface UIEButton : UIButton

@property UIColor *defaultBackgroundColor;
@property UIColor *highlightedBackgroundColor;
@property UIColor *selectedBackgroundColor;
@property UIColor *disabledBackgroundColor;

@property UIColor *defaultLayerBorderColor;
@property UIColor *highlightedLayerBorderColor;
@property UIColor *selectedLayerBorderColor;
@property UIColor *disabledLayerBorderColor;

@end
