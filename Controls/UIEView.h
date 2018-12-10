//
//  UIEView.h
//  Controls
//
//  Created by Dan Kalinin on 12/8/18.
//

#import <UIKit/UIKit.h>
#import "UIView.h"

@class UIEView;
@class UIEViewController;
@class UIEViewControllerOperation;










@interface UIEView : UIView

@end










@interface UIEViewController : UIViewController

@property (nonatomic) UIEView *view;

@property (readonly) Class operationClass;
@property (readonly) UIEViewControllerOperation *operation;

@end










@interface UIEViewControllerOperation : UIViewControllerOperation

@property (weak, readonly) UIEViewController *viewController;

@end
