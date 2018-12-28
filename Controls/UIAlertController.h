//
//  UIAlertController.h
//  Controls
//
//  Created by Dan Kalinin on 12/27/18.
//

#import <UIKit/UIKit.h>
#import "UIViewController.h"

@class UIAlertActionOperation;

@protocol UIAlertActionOperationDelegate;










@protocol UIAlertActionOperationDelegate <NSObjectOperationDelegate>

@optional
- (void)UIAlertActionOperationDidFinish:(UIAlertActionOperation *)operation;

@end



@interface UIAlertActionOperation : NSObjectOperation <UIAlertActionOperationDelegate>

@property (readonly) HLPArray<UIAlertActionOperationDelegate> *delegates;

@property (weak, readonly) UIAlertAction *object;

@end










@interface UIAlertAction (UIE)

@property (readonly) UIAlertActionOperation *nseOperation;

+ (instancetype)uieActionWithTitle:(NSString *)title style:(UIAlertActionStyle)style delegate:(id<UIAlertActionOperationDelegate>)delegate;

@end
