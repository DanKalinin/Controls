//
//  UIControl.h
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import <UIKit/UIKit.h>
#import "UIView.h"

@class UIControlOperation;

@protocol UIControlOperationDelegate;



@protocol UIControlOperationDelegate <UIViewOperationDelegate>

@end



@interface UIControlOperation : UIViewOperation <UIControlOperationDelegate>

@property (readonly) UIControl *object;

@property (weak, readonly) UIControl *weakObject;

@end
