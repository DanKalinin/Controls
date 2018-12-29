//
//  UIResponder.h
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class UIResponderOperation;

@protocol UIResponderOperationDelegate;










@protocol UIResponderOperationDelegate <NSEObjectOperationDelegate>

@end



@interface UIResponderOperation : NSEObjectOperation <UIResponderOperationDelegate>

@property (weak, readonly) UIResponder *object;

@end










@interface UIResponder (UIE)

@property (readonly) UIResponderOperation *nseOperation;

@end
