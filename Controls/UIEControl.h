//
//  UIEControl.h
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import <UIKit/UIKit.h>
#import "UIControl.h"

@class UIEControl;
@class UIEControlOperation;

@protocol UIEControlOperationDelegate;










@interface UIEControl : UIControl

@property (readonly) Class operationClass;
@property (readonly) UIEControlOperation *operation;

@end










@protocol UIEControlOperationDelegate <UIControlOperationDelegate>

@end



@interface UIEControlOperation : UIControlOperation <UIEControlOperationDelegate>

@property (weak, readonly) UIEControl *weakObject;

@end
