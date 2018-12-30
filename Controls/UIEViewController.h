//
//  UIEViewController.h
//  Controls
//
//  Created by Dan Kalinin on 12/30/18.
//

#import <UIKit/UIKit.h>
#import "UIEResponder.h"

@class UIEViewController;
@class UIEViewControllerOperation;

@protocol UIEViewControllerDelegate;










@interface UIViewController (UIE)

@property (readonly) UIEViewControllerOperation *nseOperation;

@end










@interface UIEViewController : UIViewController

@end










@protocol UIEViewControllerDelegate <UIEResponderDelegate>

@end



@interface UIEViewControllerOperation : UIEResponderOperation <UIEViewControllerDelegate>

@property (weak, readonly) UIViewController *object;

@end
