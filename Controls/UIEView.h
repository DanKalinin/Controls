//
//  UIEView.h
//  Controls
//
//  Created by Dan Kalinin on 12/8/18.
//

#import <UIKit/UIKit.h>
#import "UIView.h"

@class UIEView;
@class UIEViewOperation;

@protocol UIEViewOperationDelegate;










@interface UIEView : UIView

@property (readonly) Class operationClass;
@property (readonly) UIEViewOperation *operation;

@end










@protocol UIEViewOperationDelegate <UIViewOperationDelegate>

@end



@interface UIEViewOperation : UIViewOperation

@property (weak, readonly) UIEView *weakObject;

@end
