//
//  UIButton.h
//  Controls
//
//  Created by Dan Kalinin on 12/24/18.
//

#import <UIKit/UIKit.h>
#import "UIControl.h"

@class UIButtonOperation;

@protocol UIButtonOperationDelegate;



@protocol UIButtonOperationDelegate <UIControlOperationDelegate>

@end



@interface UIButtonOperation : UIControlOperation <UIButtonOperationDelegate>

@property (weak, readonly) UIButton *weakObject;

@end
