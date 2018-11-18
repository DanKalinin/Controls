//
//  UIEButton.h
//  Controls
//
//  Created by Dan Kalinin on 11/18/18.
//

#import <UIKit/UIKit.h>
#import "UIEControl.h"

@class UIEButton;
@class UIEButtonManager;










@interface UIEButton : UIButton

@property (readonly) UIEButtonManager *manager;

@end










@interface UIEButtonManager : UIEControlManager

@end
