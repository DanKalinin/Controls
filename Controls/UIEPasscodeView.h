//
//  UIEPasscodeView.h
//  Controls
//
//  Created by Dan Kalinin on 1/5/19.
//

#import "UIEControl.h"

@class UIEPasscodeView;
@class UIEPasscodeViewOperation;

@protocol UIEPasscodeViewDelegate;










@interface UIEPasscodeView : UIEControl

@property (readonly) UIEPasscodeViewOperation *nseOperation;

@end










@protocol UIEPasscodeViewDelegate <NSObject>

@end



@interface UIEPasscodeViewOperation : UIEControlOperation <UIEPasscodeViewDelegate>

@property (weak, readonly) UIEPasscodeView *object;

@end
