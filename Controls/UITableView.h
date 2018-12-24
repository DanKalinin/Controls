//
//  UITableView.h
//  Controls
//
//  Created by Dan Kalinin on 12/24/18.
//

#import <UIKit/UIKit.h>
#import "UIScrollView.h"

@class UITableViewOperation;

@protocol UITableViewOperationDelegate;










@protocol UITableViewOperationDelegate <UIScrollViewOperationDelegate, UITableViewDelegate, UITableViewDataSource>

@end



@interface UITableViewOperation : UIScrollViewOperation <UITableViewOperationDelegate>

@property (readonly) HLPArray<UITableViewOperationDelegate> *delegates;

@property (weak, readonly) UITableView *weakObject;

@end










@interface UITableView (UIE)

@end
