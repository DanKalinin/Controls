//
//  UIETableView.h
//  Controls
//
//  Created by Dan Kalinin on 12/30/18.
//

#import <UIKit/UIKit.h>
#import "UIEScrollView.h"

@class UIETableView;
@class UIETableViewOperation;

@protocol UIETableViewDelegate;










@interface UITableView (UIE)

@property (readonly) UIETableViewOperation *nseOperation;

@end










@interface UIETableView : UITableView

@end










@protocol UIETableViewDelegate <UIEScrollViewDelegate>

@end



@interface UIETableViewOperation : UIEScrollViewOperation <UIETableViewDelegate>

@property (weak, readonly) UITableView *object;

@end
