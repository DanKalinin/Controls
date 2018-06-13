//
//  CTLView.m
//  Controls
//
//  Created by Dan Kalinin on 5/30/18.
//

#import "CTLView.h"










@interface CTLView ()

@end



@implementation CTLView

@end










@interface CTLViewController ()

@end



@implementation CTLViewController

@dynamic view;

@end










@implementation UIViewController (CTL)

+ (void)load {
    SEL original = @selector(prepareForSegue:sender:);
    SEL swizzled = @selector(CTLViewControllerPrepareForSegue:sender:);
    [self swizzleInstanceMethod:original with:swizzled];
}

- (void)CTLViewControllerPrepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [self CTLViewControllerPrepareForSegue:segue sender:sender];
    
    self.segue = segue;
}

#pragma mark - Accessors

- (UIStoryboardSegue *)segue {
    return self.weakDictionary[NSStringFromSelector(@selector(segue))];
}

- (void)setSegue:(UIStoryboardSegue *)segue {
    self.weakDictionary[NSStringFromSelector(@selector(segue))] = segue;
}

- (UIAlertController *)alert {
    return self.weakDictionary[NSStringFromSelector(@selector(alert))];
}

- (void)setAlert:(UIAlertController *)alert {
    self.weakDictionary[NSStringFromSelector(@selector(alert))] = alert;
}

@end
