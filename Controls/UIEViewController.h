//
//  UIEViewController.h
//  Controls
//
//  Created by Dan Kalinin on 12/20/18.
//

#import <UIKit/UIKit.h>

#import "UIViewController.h"
#import "UIEView.h"

@class UIEViewController;
@class UIEViewControllerOperation;










@interface UIEViewController : UIViewController

@property (nonatomic) UIEView *view;

@property (readonly) Class operationClass;
@property (readonly) UIEViewControllerOperation *operation;

@end










@interface UIEViewControllerOperation : UIViewControllerOperation

@property (weak, readonly) UIEViewController *viewController;

@end
