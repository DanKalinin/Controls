//
//  UIEController.h
//  Controls
//
//  Created by Dan Kalinin on 12/8/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class UIEControllerOperation;
@class UIEControllerOperationPrepareForSegueInfo;










@interface UIEControllerOperationPrepareForSegueInfo : HLPObject

@property (readonly) UIStoryboardSegue *segue;
@property (readonly) id sender;

- (instancetype)initWithSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end










@protocol UIEControllerOperationDelegate <NSEOperationDelegate, UIViewControllerTransitioningDelegate>

@end



@interface UIEControllerOperation : NSEOperation <UIEControllerOperationDelegate>

@property UIEControllerOperationPrepareForSegueInfo *prepareForSegueInfo;

@property (readonly) HLPArray<UIEControllerOperationDelegate> *delegates;

@property (weak, readonly) UIViewController *controller;

- (instancetype)initWithController:(UIViewController *)controller;

@end
