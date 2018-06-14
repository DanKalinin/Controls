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










@interface CTLPreviewAction ()

@property UIPreviewAction *action;
@property UIViewController *previewViewController;

@end



@implementation CTLPreviewAction

@dynamic delegates;

- (instancetype)initWithTitle:(NSString *)title style:(UIPreviewActionStyle)style identifier:(NSString *)identifier delegate:(id<CTLPreviewActionDelegate>)delegate {
    self = [super initWithIdentifier:identifier delegate:delegate];
    if (self) {
        self.action = [UIPreviewAction actionWithTitle:title style:style handler:^(UIPreviewAction *action, UIViewController *previewViewController) {
            self.previewViewController = previewViewController;
            
            [self updateState:HLPOperationStateDidEnd];
        }];
    }
    return self;
}

#pragma mark - Helpers

- (void)updateState:(HLPOperationState)state {
    [super updateState:state];
    
    [self.delegates CTLPreviewActionDidEnd:self];
}

@end
