//
//  UIBarItem.h
//  Controls
//
//  Created by Dan Kalinin on 12/25/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class UIBarItemOperation;

@protocol UIBarItemOperationDelegate;










@protocol UIBarItemOperationDelegate <NSEObjectOperationDelegate>

@end



@interface UIBarItemOperation : NSEObjectOperation <UIBarItemOperationDelegate>

@property (weak, readonly) UIBarItem *object;

@end










@interface UIBarItem (UIE)

@property (readonly) UIBarItemOperation *nseOperation;

@end
