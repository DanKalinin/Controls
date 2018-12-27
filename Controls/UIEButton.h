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

@property UIColor *uieDefaultBackgroundColor;
@property UIColor *uieHighlightedBackgroundColor;
@property UIColor *uieSelectedBackgroundColor;
@property UIColor *uieDisabledBackgroundColor;

@property UIColor *uieDefaultLayerBorderColor;
@property UIColor *uieHighlightedLayerBorderColor;
@property UIColor *uieSelectedLayerBorderColor;
@property UIColor *uieDisabledLayerBorderColor;

@end
