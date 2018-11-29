//
//  UIETableView.h
//  Controls
//
//  Created by Dan Kalinin on 11/29/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class UIETableView;
@class UIETableViewOperation;










@interface UIETableView : UITableView

@property (readonly) Class operationClass;
@property (readonly) UIETableViewOperation *operation;

@end










@protocol UIETableViewOperationDelegate <NSEOperationDelegate, UITableViewDelegate, UITableViewDataSource>

@end



@interface UIETableViewOperation : NSEOperation <UIETableViewOperationDelegate>

@property (readonly) HLPArray<UIETableViewOperationDelegate> *delegates;

@property (weak, readonly) UIETableView *tableView;

- (instancetype)initWithTableView:(UIETableView *)tableView;

@end
