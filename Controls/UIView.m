//
//  UIView.m
//  Controls
//
//  Created by Dan Kalinin on 12/8/18.
//

#import "UIView.h"










@interface UIViewControllerOperationPrepareForSegueInfo ()

@property UIStoryboardSegue *segue;
@property id sender;

@end



@implementation UIViewControllerOperationPrepareForSegueInfo

- (instancetype)initWithSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self = super.init;
    if (self) {
        self.segue = segue;
        self.sender = sender;
    }
    return self;
}

@end










@interface UIViewControllerOperation ()

@property (weak) UIViewController *viewController;

@end



@implementation UIViewControllerOperation

@dynamic delegates;

- (instancetype)initWithViewController:(UIViewController *)controller {
    self = super.init;
    if (self) {
        self.viewController = controller;
        self.viewController.transitioningDelegate = self.delegates;
    }
    return self;
}

@end










@interface UIEPreviewAction ()

@property UIPreviewAction *previewAction;
@property UIViewController *previewViewController;

@end



@implementation UIEPreviewAction

@dynamic delegates;

- (instancetype)initWithTitle:(NSString *)title style:(UIPreviewActionStyle)style identifier:(NSString *)identifier delegate:(id<UIEPreviewActionDelegate>)delegate {
    self = [super initWithIdentifier:identifier delegate:delegate];
    if (self) {
        self.previewAction = [UIPreviewAction actionWithTitle:title style:style handler:^(UIPreviewAction *action, UIViewController *previewViewController) {
            self.previewViewController = previewViewController;
            
            [self.delegates UIEActionDidFinish:self];
            [self.delegates UIEPreviewActionDidFinish:self];
        }];
    }
    return self;
}

@end
