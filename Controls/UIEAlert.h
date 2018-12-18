//
//  UIEAlert.h
//  Controls
//
//  Created by Dan Kalinin on 12/17/18.
//

#import <UIKit/UIKit.h>
#import "UIEAction.h"

@class UIEAlertAction;

@protocol UIEAlertActionDelegate;



@protocol UIEAlertActionDelegate <UIEActionDelegate>

@optional
- (void)UIEAlertActionDidFinish:(UIEAlertAction *)alertAction;

@end



@interface UIEAlertAction : UIEAction <UIEAlertActionDelegate>

@property (readonly) HLPArray<UIEAlertActionDelegate> *delegates;
@property (readonly) UIAlertAction *alertAction;

- (instancetype)initWithTitle:(NSString *)title style:(UIAlertActionStyle)style identifier:(NSString *)identifier delegate:(id<UIEAlertActionDelegate>)delegate;

@end
