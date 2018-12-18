//
//  UIEAction.h
//  Controls
//
//  Created by Dan Kalinin on 12/17/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class UIEAction;

@protocol UIEActionDelegate;



@protocol UIEActionDelegate <NSEOperationDelegate>

@optional
- (void)UIEActionDidFinish:(UIEAction *)action;

@end



@interface UIEAction : NSEOperation <UIEActionDelegate>

@property (readonly) HLPArray<UIEActionDelegate> *delegates;
@property (readonly) NSString *identifier;

- (instancetype)initWithIdentifier:(NSString *)identifier delegate:(id<UIEActionDelegate>)delegate;

@end
