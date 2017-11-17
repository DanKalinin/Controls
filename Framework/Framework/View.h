//
//  View.h
//  Controls
//
//  Created by Dan Kalinin on 11/16/17.
//

#import <UIKit/UIKit.h>

@class View, ImageView, TextField, Button, KeyboardContainerView, ShapeLayerView, GradientLayerView, GradientLayerView2, EmitterLayerView;










@interface View : UIView // Customized view

@property (weak, nonatomic) IBOutlet ImageView *imageView1;

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;

@end










@interface ImageView : UIImageView // Customized image view

@property IBInspectable UIColor *defaultBackgroundColor;
@property IBInspectable UIColor *highlightedBackgroundColor;

@end










@interface TextField : UITextField // Customized text field

@property IBInspectable BOOL validateOnEditing;
@property IBInspectable NSString *pattern;

@property (readonly) BOOL valid;

@end










@interface Button : UIButton // Customized button

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *subbuttons; // Subbuttons changing their state together with receiver

@property (weak, nonatomic) IBOutlet Button *button1; // Convenience outlet connections
@property (weak, nonatomic) IBOutlet Button *button2;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet ImageView *imageView1;
@property (weak, nonatomic) IBOutlet ImageView *imageView2;
@property (weak, nonatomic) IBOutlet ShapeLayerView *shapeLayerView;

@property IBInspectable UIColor *defaultBackgroundColor; // Background color for different states
@property IBInspectable UIColor *highlightedBackgroundColor;
@property IBInspectable UIColor *selectedBackgroundColor;
@property IBInspectable UIColor *disabledBackgroundColor;

@property IBInspectable UIColor *defaultBorderColor; // Layer's border color for different states
@property IBInspectable UIColor *highlightedBorderColor;
@property IBInspectable UIColor *selectedBorderColor;
@property IBInspectable UIColor *disabledBorderColor;

@property IBInspectable BOOL toggle; // Should the receiver to invert @ selected property on tap

@end










@interface KeyboardContainerView : View // Content container view, which size is changing based on keyboard apperance

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint; // Constraint which constant is changing based on keyboard appearance

@end










@interface ShapeLayerView : View

@property (class, readonly) Class layerClass;
@property (readonly) CAShapeLayer *layer;

@property IBInspectable UIColor *fillColor;
@property IBInspectable UIColor *strokeColor;

@end










@interface GradientLayerView : View

@property (class, readonly) Class layerClass;
@property (readonly) CAGradientLayer *layer;

@end










@interface GradientLayerView2 : GradientLayerView

@property IBInspectable UIColor *startColor;
@property IBInspectable UIColor *endColor;

@end










@interface EmitterCellImageView : ImageView

@property (readonly) CAEmitterCell *cell;

@end










@interface EmitterLayerView : View

@property (strong, nonatomic) IBOutletCollection(EmitterCellImageView) NSArray *cells;

@property (class, readonly) Class layerClass;
@property (readonly) CAEmitterLayer *layer;

@end










@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;

@property (strong, nonatomic) IBOutlet UILabel *strongLabel1;
@property (strong, nonatomic) IBOutlet UILabel *strongLabel2;

@end
