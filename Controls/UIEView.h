//
//  UIEView.h
//  Controls
//
//  Created by Dan Kalinin on 11/30/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class UIEViewControllerPrepareForSegueInfo;










@interface UIEViewControllerPrepareForSegueInfo : HLPObject

@property (readonly) UIStoryboardSegue *segue;

- (instancetype)initWithSegue:(UIStoryboardSegue *)segue;

@end










@interface UIView (UIE)

@property IBInspectable UIColor *layerBorderColor;

@end










@interface UIViewController (UIE)

@property UIEViewControllerPrepareForSegueInfo *prepareForSegueInfo;

@end
