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



@protocol UIResponderOperationDelegate <NSObjectOperationDelegate>

@end



@interface UIResponderOperation : NSObjectOperation <UIResponderOperationDelegate>

@property (readonly) UIResponder *object;

@property (weak, readonly) UIResponder *weakObject;

@end
