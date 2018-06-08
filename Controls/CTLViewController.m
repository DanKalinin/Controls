//
//  CTLViewController.m
//  Controls
//
//  Created by Dan Kalinin on 6/5/18.
//

#import "CTLViewController.h"
#import <Helpers/Helpers.h>










@interface CTLViewController ()

@end



@implementation CTLViewController

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

@end
