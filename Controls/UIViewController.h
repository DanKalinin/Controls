//
//  UIViewController.h
//  Controls
//
//  Created by Dan Kalinin on 12/8/18.
//

#import <UIKit/UIKit.h>
#import "UIResponder.h"
#import "UIEAction.h"

@class UIViewControllerOperationPrepareForSegueInfo;
@class UIViewControllerOperation;
@class UIEPreviewAction;

@protocol UIViewControllerOperationDelegate;
@protocol UIEPreviewActionDelegate;










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










@protocol UIEPreviewActionDelegate <UIEActionDelegate>

@optional
- (void)UIEPreviewActionDidFinish:(UIEPreviewAction *)previewAction;

@end



@interface UIEPreviewAction : UIEAction <UIEPreviewActionDelegate>

@property (readonly) HLPArray<UIEPreviewActionDelegate> *delegates;
@property (readonly) UIPreviewAction *previewAction;
@property (readonly) UIViewController *previewViewController;

- (instancetype)initWithTitle:(NSString *)title style:(UIPreviewActionStyle)style identifier:(NSString *)identifier delegate:(id<UIEPreviewActionDelegate>)delegate;

@end
