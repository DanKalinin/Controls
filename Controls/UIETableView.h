//
//  UIETableView.h
//  Controls
//
//  Created by Dan Kalinin on 11/29/18.
//

#import <UIKit/UIKit.h>
#import "UIView.h"
#import "UIEButton.h"
#import "UIETextField.h"
#import "UIEAction.h"

@class UIETableView;
@class UIETableViewOperationNumberOfSectionsInfo;
@class UIETableViewOperationNumberOfRowsInfo;
@class UIETableViewOperationCellForRowInfo;
@class UIETableViewOperationDidSelectRowInfo;
@class UIETableViewOperation;
@class UIETableViewCell;
@class UIETableViewController;
@class UIETableViewControllerOperation;
@class UIETableViewRowAction;










@interface UIETableView : UITableView

@property (readonly) Class operationClass;
@property (readonly) UIETableViewOperation *operation;

@end










@interface UIETableViewOperationNumberOfSectionsInfo : HLPObject

@property NSInteger sections;

@end










@interface UIETableViewOperationNumberOfRowsInfo : HLPObject

@property NSInteger rows;

@property (readonly) NSInteger section;

- (instancetype)initWithSection:(NSInteger)section;

@end










@interface UIETableViewOperationCellForRowInfo : HLPObject

@property UIETableViewCell *cell;

@property (readonly) NSIndexPath *indexPath;

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath;

@end










@interface UIETableViewOperationDidSelectRowInfo : HLPObject

@property (readonly) NSIndexPath *indexPath;

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath;

@end










@protocol UIETableViewOperationDelegate <NSEOperationDelegate, UITableViewDelegate, UITableViewDataSource>

@optional
- (void)UIETableViewOperationNumberOfSections:(UIETableViewOperation *)operation;
- (void)UIETableViewOperationNumberOfRows:(UIETableViewOperation *)operation;
- (void)UIETableViewOperationCellForRow:(UIETableViewOperation *)operation;
- (void)UIETableViewOperationDidSelectRow:(UIETableViewOperation *)operation;

@end



@interface UIETableViewOperation : NSEOperation <UIETableViewOperationDelegate>

@property (readonly) HLPArray<UIETableViewOperationDelegate> *delegates;
@property (readonly) UIETableViewOperationNumberOfSectionsInfo *numberOfSectionsInfo;
@property (readonly) UIETableViewOperationNumberOfRowsInfo *numberOfRowsInfo;
@property (readonly) UIETableViewOperationCellForRowInfo *cellForRowInfo;
@property (readonly) UIETableViewOperationDidSelectRowInfo *didSelectRowInfo;

@property (weak, readonly) UIETableView *tableView;

- (instancetype)initWithTableView:(UIETableView *)tableView;

@end










@interface UIETableViewCell : UITableViewCell

@property (weak) IBOutlet UIEButton *weakButton1;
@property (weak) IBOutlet UIEButton *weakButton2;

@property (weak) IBOutlet UIETextField *weakTextField1;

@property (weak) IBOutlet UIActivityIndicatorView *weakActivityIndicatorView1;

@property (readonly) BOOL enabled;

- (void)setEnabled:(BOOL)enabled animated:(BOOL)animated;

@end










@interface UIETableViewController : UITableViewController <UIETableViewOperationDelegate>

@property (nonatomic) UIETableView *tableView;

@property (readonly) Class operationClass;
@property (readonly) UIETableViewControllerOperation *operation;

@end










@protocol UIETableViewControllerOperationDelegate <UIViewControllerOperationDelegate>

@end



@interface UIETableViewControllerOperation : UIViewControllerOperation <UIETableViewControllerOperationDelegate>

@property (weak, readonly) UIETableViewController *viewController;

@end










@protocol UIETableViewRowActionDelegate <UIEActionDelegate>

@optional
- (void)UIETableViewRowActionDidFinish:(UIETableViewRowAction *)rowAction;

@end



@interface UIETableViewRowAction : UIEAction <UIETableViewRowActionDelegate>

@property (readonly) HLPArray<UIETableViewRowActionDelegate> *delegates;
@property (readonly) UITableViewRowAction *rowAction;
@property (readonly) NSIndexPath *indexPath;

- (instancetype)initWithStyle:(UITableViewRowActionStyle)style title:(NSString *)title identifier:(NSString *)identifier delegate:(id<UIETableViewRowActionDelegate>)delegate;

@end
