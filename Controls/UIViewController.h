//
//  UIViewController.h
//  Controls
//
//  Created by Dan Kalinin on 12/8/18.
//

#import <UIKit/UIKit.h>
#import "UIResponder.h"

@class UIViewControllerOperationPrepareForSegueInfo;
@class UIViewControllerOperation;
@class UIPreviewActionOperation;

@protocol UIViewControllerOperationDelegate;
@protocol UIPreviewActionOperationDelegate;










@interface UIViewControllerOperationPrepareForSegueInfo : HLPObject

@property (readonly) UIStoryboardSegue *segue;
@property (readonly) id sender;

- (instancetype)initWithSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end










@protocol UIViewControllerOperationDelegate <UIResponderOperationDelegate, UIViewControllerTransitioningDelegate>

@optional
- (void)UIViewControllerOperationViewDidLoad:(UIViewControllerOperation *)operation;

@end



@interface UIViewControllerOperation : UIResponderOperation <UIViewControllerOperationDelegate>

@property UIViewControllerOperationPrepareForSegueInfo *prepareForSegueInfo;

@property (readonly) HLPArray<UIViewControllerOperationDelegate> *delegates;

@property (weak, readonly) UIViewController *object;

@end










@interface UIViewController (UIE)

@property (readonly) UIViewControllerOperation *operation;

@end










@protocol UIPreviewActionOperationDelegate <NSObjectOperationDelegate>

@optional
- (void)UIPreviewActionOperationDidFinish:(UIPreviewActionOperation *)operation;

@end



@interface UIPreviewActionOperation : NSObjectOperation <UIPreviewActionOperationDelegate>

@property (readonly) HLPArray<UIPreviewActionOperationDelegate> *delegates;
@property (readonly) UIViewController *previewViewController;

@property (weak, readonly) UIPreviewAction *object;

@end










@interface UIPreviewAction (UIE)

@property (readonly) UIPreviewActionOperation *operation;

+ (instancetype)actionWithTitle:(NSString *)title style:(UIPreviewActionStyle)style delegate:(id<UIPreviewActionOperationDelegate>)delegate;

@end
