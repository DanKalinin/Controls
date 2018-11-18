//
//  UIEResponder.h
//  Controls
//
//  Created by Dan Kalinin on 11/19/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class UIEResponderManager;



@protocol UIEResponderDelegate <NSEOperationDelegate>

@end



@interface UIEResponderManager : NSEOperation <UIEResponderDelegate>

@property (weak, readonly) UIResponder *responder;

- (instancetype)initWithResponder:(UIResponder *)responder;

@end
