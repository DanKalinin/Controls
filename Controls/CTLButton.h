//
//  CTLButton.h
//  Controls
//
//  Created by Dan Kalinin on 6/11/18.
//

#import <UIKit/UIKit.h>
#import "CTLView.h"

@class CTLButton;



@interface CTLButton : UIButton

@property IBInspectable UIColor *defaultBackgroundColor;
@property IBInspectable UIColor *highlightedBackgroundColor;
@property IBInspectable UIColor *selectedBackgroundColor;
@property IBInspectable UIColor *disabledBackgroundColor;

@property IBInspectable UIColor *defaultLayerBorderColor;
@property IBInspectable UIColor *highlightedLayerBorderColor;
@property IBInspectable UIColor *selectedLayerBorderColor;
@property IBInspectable UIColor *disabledLayerBorderColor;

@property IBOutlet CTLButton *button1;

@end
