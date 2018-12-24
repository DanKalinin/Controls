//
//  UIBarButtonItem.h
//  Controls
//
//  Created by Dan Kalinin on 12/25/18.
//

#import <UIKit/UIKit.h>
#import "UIBarItem.h"

@class UIBarButtonItemOperation;

@protocol UIBarButtonItemOperationDelegate;










@protocol UIBarButtonItemOperationDelegate <UIBarItemOperationDelegate>

@end



@interface UIBarButtonItemOperation : UIBarItemOperation <UIBarButtonItemOperationDelegate>

@property (weak, readonly) UIBarButtonItem *weakObject;

@end










@interface UIBarButtonItem (UIE)

@end
