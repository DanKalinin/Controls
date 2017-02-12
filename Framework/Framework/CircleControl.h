//
//  CircleControl.h
//  SectorControl
//
//  Created by Dan Kalinin on 2/9/17.
//  Copyright © 2017 Dan Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>










@interface CircleControlConfiguration : UIView

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property IBInspectable CGFloat circleWidth;

@property IBInspectable CGFloat minAngle;
@property IBInspectable CGFloat maxAngle;
@property IBInspectable CGFloat angularStep;
@property IBInspectable BOOL respectBounds;

@end



@interface CircleControl : UIControl

@property (strong, nonatomic) IBOutlet CircleControlConfiguration *configuration;

@property (readonly) CGFloat angle;
- (void)setAngle:(CGFloat)angle animated:(BOOL)animated;

@end










@interface CircleValueControlConfiguration : CircleControlConfiguration

@property IBInspectable CGFloat minValue;
@property IBInspectable CGFloat maxValue;
@property IBInspectable CGFloat valueStep;

@end



@interface CircleValueControl : CircleControl

@property (strong, nonatomic) IBOutlet CircleValueControlConfiguration *configuration;

@property (readonly) CGFloat value;
- (void)setValue:(CGFloat)value animated:(BOOL)animated;

@end
