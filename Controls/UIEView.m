//
//  UIEView.m
//  Controls
//
//  Created by Dan Kalinin on 11/30/18.
//

#import "UIEView.h"










@interface UIEViewControllerPrepareForSegueInfo ()

@property UIStoryboardSegue *segue;

@end



@implementation UIEViewControllerPrepareForSegueInfo

- (instancetype)initWithSegue:(UIStoryboardSegue *)segue {
    self = super.init;
    if (self) {
        self.segue = segue;
    }
    return self;
}

@end










@implementation UIView (UIE)

- (UIColor *)layerBorderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setLayerBorderColor:(UIColor *)layerBorderColor {
    self.layer.borderColor = layerBorderColor.CGColor;
}

@end










@implementation UIViewController (UIE)

- (void)UIEViewControllerPrepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [self UIEViewControllerPrepareForSegue:segue sender:sender];
    
    self.prepareForSegueInfo = [UIEViewControllerPrepareForSegueInfo.alloc initWithSegue:segue];
}

#pragma mark - Accessors

- (UIEViewControllerPrepareForSegueInfo *)prepareForSegueInfo {
    return self.strongDictionary[NSStringFromSelector(@selector(prepareForSegueInfo))];
}

- (void)setPrepareForSegueInfo:(UIEViewControllerPrepareForSegueInfo *)prepareForSegueInfo {
    self.strongDictionary[NSStringFromSelector(@selector(prepareForSegueInfo))] = prepareForSegueInfo;
}

@end
