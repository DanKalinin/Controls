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
- (void)uiViewControllerViewDidLoad:(UIViewController *)viewController;

@end



@interface UIViewControllerOperation : UIResponderOperation <UIViewControllerOperationDelegate>

@property UIViewControllerOperationPrepareForSegueInfo *prepareForSegueInfo;

@property (readonly) HLPArray<UIViewControllerOperationDelegate> *delegates;

@property (weak, readonly) UIViewController *object;

@end










@interface UIViewController (UIE)

@property (readonly) UIViewControllerOperation *nseOperation;

@end










@protocol UIPreviewActionOperationDelegate <NSEObjectOperationDelegate>

@optional
- (void)uiPreviewActionOperationDidFinish:(UIPreviewActionOperation *)operation;

@end



@interface UIPreviewActionOperation : NSEObjectOperation <UIPreviewActionOperationDelegate>

@property (readonly) HLPArray<UIPreviewActionOperationDelegate> *delegates;
@property (readonly) UIViewController *previewViewController;

@property (weak, readonly) UIPreviewAction *object;

@end










@interface UIPreviewAction (UIE)

@property (readonly) UIPreviewActionOperation *nseOperation;

+ (instancetype)uieActionWithTitle:(NSString *)title style:(UIPreviewActionStyle)style delegate:(id<UIPreviewActionOperationDelegate>)delegate;

@end
