//
//  UIEControl.h
//  Controls
//
//  Created by Dan Kalinin on 10/31/18.
//

#import <Helpers/Helpers.h>



@protocol UIEControlDelegate <NSEOperationDelegate>

@end



@interface UIEControl : NSEOperation <UIEControlDelegate>

@property (readonly) UIControl *control;

- (instancetype)initWithControl:(UIControl *)control;

@end
