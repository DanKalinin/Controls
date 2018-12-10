//
//  UIView.h
//  Controls
//
//  Created by Dan Kalinin on 12/8/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class UIViewControllerOperation;
@class UIViewControllerOperationPrepareForSegueInfo;










@interface UIViewControllerOperationPrepareForSegueInfo : HLPObject

@property (readonly) UIStoryboardSegue *segue;
@property (readonly) id sender;

- (instancetype)initWithSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end










@protocol UIEControllerOperationDelegate <NSEOperationDelegate, UIViewControllerTransitioningDelegate>

@end



@interface UIViewControllerOperation : NSEOperation <UIEControllerOperationDelegate>

@property UIViewControllerOperationPrepareForSegueInfo *prepareForSegueInfo;

@property (readonly) HLPArray<UIEControllerOperationDelegate> *delegates;

@property (weak, readonly) UIViewController *viewController;

- (instancetype)initWithViewController:(UIViewController *)viewController;

@end
