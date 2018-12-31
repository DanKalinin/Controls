//
//  UIEViewController.h
//  Controls
//
//  Created by Dan Kalinin on 12/30/18.
//

#import <UIKit/UIKit.h>
#import "UIEResponder.h"

@class UIEViewController;
@class UIEViewControllerPrepareForSegue;
@class UIEViewControllerOperation;

@protocol UIEViewControllerDelegate;










@interface UIViewController (UIE)

@property (readonly) UIEViewControllerOperation *nseOperation;

@end










@interface UIEViewController : UIViewController

@end










@interface UIEViewControllerPrepareForSegue : NSEObject

@property (readonly) UIStoryboardSegue *segue;
@property (readonly) id sender;

- (instancetype)initWithSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end










@protocol UIEViewControllerDelegate <UIEResponderDelegate>

@end



@interface UIEViewControllerOperation : UIEResponderOperation <UIEViewControllerDelegate>

@property (readonly) UIEViewControllerPrepareForSegue *prepareForSegue;

@property (weak, readonly) UIViewController *object;

- (void)viewDidLoad;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end
