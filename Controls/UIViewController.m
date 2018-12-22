//
//  UIViewController.m
//  Controls
//
//  Created by Dan Kalinin on 12/8/18.
//

#import "UIViewController.h"
#import "UIEStoryboardSegue.h"










@interface UIViewControllerOperationPrepareForSegueInfo ()

@property UIEStoryboardSegue *segue;
@property id sender;

@end



@implementation UIViewControllerOperationPrepareForSegueInfo

- (instancetype)initWithSegue:(UIEStoryboardSegue *)segue sender:(id)sender {
    self = super.init;
    if (self) {
        self.segue = segue;
        self.sender = sender;
    }
    return self;
}

@end










@interface UIViewControllerOperation ()

@end



@implementation UIViewControllerOperation

@dynamic delegates;
@dynamic weakObject;

- (instancetype)initWithWeakObject:(NSObject *)weakObject {
    self = [super initWithWeakObject:weakObject];
    if (self) {
        self.weakObject.transitioningDelegate = self.delegates;
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
