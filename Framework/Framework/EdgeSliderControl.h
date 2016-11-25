//
//  SliderView.h
//  PickerControl
//
//  Created by Dan Kalinin on 25/11/16.
//  Copyright © 2016 Dan Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface EdgeSliderControl : UIControl

@property IBInspectable UIRectEdge edge;
@property IBInspectable CGFloat inset;
@property IBInspectable UIColor *dimmingColor;

@property CGSize intrinsicContentSize;

- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (void)toggleAnimated:(BOOL)animated;

@end
