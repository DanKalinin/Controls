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










@protocol UIBarItemOperationDelegate <NSObjectOperationDelegate>

@end



@interface UIBarItemOperation : NSObjectOperation <UIBarItemOperationDelegate>

@property (weak, readonly) UIBarItem *weakObject;

@end










@interface UIBarItem (UIE)

@end