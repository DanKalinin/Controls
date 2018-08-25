//
//  CTLLabel.h
//  Controls
//
//  Created by Dan Kalinin on 8/14/18.
//

#import <UIKit/UIKit.h>
#import "CTLView.h"

@class CTLLabel;



@interface CTLLabel : UILabel

@property IBInspectable UIColor *defaultBackgroundColor;
@property IBInspectable UIColor *highlightedBackgroundColor;
@property IBInspectable UIColor *disabledBackgroundColor;

@property IBInspectable UIColor *defaultLayerBorderColor;
@property IBInspectable UIColor *highlightedLayerBorderColor;
@property IBInspectable UIColor *disabledLayerBorderColor;

@end
