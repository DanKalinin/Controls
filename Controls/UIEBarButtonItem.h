//
//  UIEBarButtonItem.h
//  Controls
//
//  Created by Dan Kalinin on 12/31/18.
//

#import <UIKit/UIKit.h>
#import "UIEBarItem.h"

@class UIEBarButtonItem;
@class UIEBarButtonItemOperation;

@protocol UIEBarButtonItemDelegate;










@interface UIBarButtonItem (UIE)

@property (readonly) UIEBarButtonItemOperation *nseOperation;

@end










@interface UIEBarButtonItem : UIBarButtonItem

@end










@interface UIEBarButtonItemEvent : NSEObject

@property (readonly) UIEvent *event;

- (instancetype)initWithEvent:(UIEvent *)event;

@end










@protocol UIEBarButtonItemDelegate <UIEBarItemDelegate>

@optional
- (void)uieBarButtonItemTouchUpInside:(UIBarButtonItem *)item;

@end



@interface UIEBarButtonItemOperation : UIEBarItemOperation <UIEBarButtonItemDelegate>

@property (readonly) HLPArray<UIEBarButtonItemDelegate> *delegates;
@property (readonly) UIEBarButtonItemEvent *touchUpInside;

@property (weak, readonly) UIBarButtonItem *object;

@end
