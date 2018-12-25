//
//  UIEBarButtonItem.h
//  Controls
//
//  Created by Dan Kalinin on 12/25/18.
//

#import <UIKit/UIKit.h>
#import "UIBarButtonItem.h"

@class UIEBarButtonItemOperation;

@protocol UIEBarButtonItemOperationDelegate;










@interface UIEBarButtonItem : UIBarButtonItem

@property (readonly) Class operationClass;
@property (readonly) UIEBarButtonItemOperation *operation;

@end










@protocol UIEBarButtonItemOperationDelegate <UIBarButtonItemOperationDelegate>

@end



@interface UIEBarButtonItemOperation : UIBarButtonItemOperation <UIEBarButtonItemOperationDelegate>

@property (weak, readonly) UIEBarButtonItem *weakObject;

@end
