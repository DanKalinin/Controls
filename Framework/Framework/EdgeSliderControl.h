//
//  SliderView.h
//  PickerControl
//
//  Created by Dan Kalinin on 25/11/16.
//  Copyright © 2016 Dan Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerControl.h"



@interface EdgeSliderControl : UIControl

@property (weak, nonatomic) IBOutlet PickerControl *picker1;
@property (weak, nonatomic) IBOutlet PickerControl *picker2;
@property (weak, nonatomic) IBOutlet PickerControl *picker3;

@property IBInspectable UIRectEdge edge;
@property IBInspectable CGFloat inset;
@property IBInspectable UIColor *dimmingColor;

- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (void)toggleAnimated:(BOOL)animated;

@end
