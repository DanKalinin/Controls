//
//  UIWindow.h
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import <UIKit/UIKit.h>
#import "UIView.h"



@protocol UIWindowOperationDelegate <UIViewOperationDelegate>

@end



@interface UIWindowOperation : UIViewOperation <UIWindowOperationDelegate>

@property (readonly) UIWindow *object;

@property (weak, readonly) UIWindow *weakObject;

@end
