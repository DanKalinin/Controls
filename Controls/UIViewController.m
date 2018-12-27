//
//  UIViewController.m
//  Controls
//
//  Created by Dan Kalinin on 12/8/18.
//

#import "UIViewController.h"










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

@end



@implementation UIViewControllerOperation

@dynamic delegates;
@dynamic object;

- (instancetype)initWithObject:(UIViewController *)object {
    self = [super initWithObject:object];
    if (self) {
        self.object.transitioningDelegate = self.delegates;
    }
    return self;
}

#pragma mark - View controller operation

- (void)UIViewControllerOperationViewDidLoad:(UIViewControllerOperation *)operation {
    
}

@end










@implementation UIViewController (UIE)

@dynamic operation;

- (Class)operationClass {
    return UIViewControllerOperation.class;
}

@end










@interface UIPreviewActionOperation ()

@property UIViewController *previewViewController;

@end



@implementation UIPreviewActionOperation

@dynamic delegates;
@dynamic object;

@end










@implementation UIPreviewAction (UIE)

@dynamic operation;

+ (instancetype)actionWithTitle:(NSString *)title style:(UIPreviewActionStyle)style delegate:(id<UIPreviewActionOperationDelegate>)delegate {
    UIPreviewAction *previewAction = [UIPreviewAction actionWithTitle:title style:style handler:^(UIPreviewAction *previewAction, UIViewController *previewViewController) {
        previewAction.operation.previewViewController = previewViewController;
        [previewAction.operation.delegates UIPreviewActionOperationDidFinish:previewAction.operation];
    }];
    [previewAction.operation.delegates addObject:delegate];
    return previewAction;
}

- (Class)operationClass {
    return UIPreviewActionOperation.class;
}

@end
