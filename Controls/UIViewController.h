//
//  UIViewController.h
//  Controls
//
//  Created by Dan Kalinin on 12/8/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>
#import "UIEAction.h"

@class UIViewControllerOperationPrepareForSegueInfo;
@class UIViewControllerOperation;
@class UIEPreviewAction;
@class UIEStoryboardSegue;

@protocol UIViewControllerOperationDelegate;
@protocol UIEPreviewActionDelegate;










@interface UIViewControllerOperationPrepareForSegueInfo : HLPObject

@property (readonly) UIEStoryboardSegue *segue;
@property (readonly) id sender;

- (instancetype)initWithSegue:(UIEStoryboardSegue *)segue sender:(id)sender;

@end










@protocol UIViewControllerOperationDelegate <NSEOperationDelegate, UIViewControllerTransitioningDelegate>

@end



@interface UIViewControllerOperation : NSEOperation <UIViewControllerOperationDelegate>

@property UIViewControllerOperationPrepareForSegueInfo *prepareForSegueInfo;

@property (readonly) HLPArray<UIViewControllerOperationDelegate> *delegates;

@property (weak, readonly) UIViewController *viewController;

- (instancetype)initWithViewController:(UIViewController *)viewController;

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
