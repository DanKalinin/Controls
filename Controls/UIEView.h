//
//  UIEView.h
//  Controls
//
//  Created by Dan Kalinin on 12/30/18.
//

#import <UIKit/UIKit.h>
#import "UIEResponder.h"

@class UIEView;
@class UIEViewOperation;

@protocol UIEViewDelegate;










@interface UIView (UIE)

@property (readonly) UIEViewOperation *nseOperation;

@property IBInspectable UIColor *uieLayerBorderColor;

@property (weak) IBOutlet UIButton *uieWeakButton1;
@property (weak) IBOutlet UIButton *uieWeakButton2;

@property (weak) IBOutlet UITextField *uieWeakTextField1;

@property (weak) IBOutlet UIActivityIndicatorView *uieWeakActivityIndicatorView1;

@end










@interface UIEView : UIView

@end










@protocol UIEViewDelegate <UIEResponderDelegate>

@end



@interface UIEViewOperation : UIEResponderOperation <UIEViewDelegate>

@property (weak, readonly) UIView *object;

@end
