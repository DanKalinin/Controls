//
//  CTLButton.h
//  Controls
//
//  Created by Dan Kalinin on 6/11/18.
//

#import <UIKit/UIKit.h>

@class CTLButton;



@interface CTLButton : UIButton

@property IBInspectable UIColor *defaultBackgroundColor;
@property IBInspectable UIColor *highlightedBackgroundColor;
@property IBInspectable UIColor *selectedBackgroundColor;
@property IBInspectable UIColor *disabledBackgroundColor;

@end
