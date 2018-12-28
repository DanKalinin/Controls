//
//  UITableView.h
//  Controls
//
//  Created by Dan Kalinin on 12/24/18.
//

#import <UIKit/UIKit.h>
#import "UIScrollView.h"

@class UITableViewOperationNumberOfSectionsInfo;
@class UITableViewOperationNumberOfRowsInfo;
@class UITableViewOperationCellForRowInfo;
@class UITableViewOperationDidSelectRowInfo;
@class UITableViewOperation;
@class UITableViewRowActionOperation;

@protocol UITableViewOperationDelegate;
@protocol UITableViewRowActionOperationDelegate;










@interface UITableViewOperationNumberOfSectionsInfo : HLPObject

@property NSInteger sections;

@end










@interface UITableViewOperationNumberOfRowsInfo : HLPObject

@property NSInteger rows;

@property (readonly) NSInteger section;

- (instancetype)initWithSection:(NSInteger)section;

@end










@interface UITableViewOperationCellForRowInfo : HLPObject

@property UITableViewCell *cell;

@property (readonly) NSIndexPath *indexPath;

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath;

@end










@interface UITableViewOperationDidSelectRowInfo : HLPObject

@property (readonly) NSIndexPath *indexPath;

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath;

@end










@protocol UITableViewOperationDelegate <UIScrollViewOperationDelegate, UITableViewDelegate, UITableViewDataSource>

@optional
- (void)uiTableViewOperationNumberOfSections:(UITableViewOperation *)operation;
- (void)uiTableViewOperationNumberOfRows:(UITableViewOperation *)operation;
- (void)uiTableViewOperationCellForRow:(UITableViewOperation *)operation;
- (void)uiTableViewOperationDidSelectRow:(UITableViewOperation *)operation;

@end



@interface UITableViewOperation : UIScrollViewOperation <UITableViewOperationDelegate>

@property (readonly) HLPArray<UITableViewOperationDelegate> *delegates;
@property (readonly) UITableViewOperationNumberOfSectionsInfo *numberOfSectionsInfo;
@property (readonly) UITableViewOperationNumberOfRowsInfo *numberOfRowsInfo;
@property (readonly) UITableViewOperationCellForRowInfo *cellForRowInfo;
@property (readonly) UITableViewOperationDidSelectRowInfo *didSelectRowInfo;

@property (weak, readonly) UITableView *object;

@end










@interface UITableView (UIE)

@property (readonly) UITableViewOperation *nseOperation;

@end










@protocol UITableViewRowActionOperationDelegate <NSObjectOperationDelegate>

@optional
- (void)uiTableViewRowActionDidFinish:(UITableViewRowActionOperation *)operation;

@end



@interface UITableViewRowActionOperation : NSObjectOperation <UITableViewRowActionOperationDelegate>

@property (readonly) HLPArray<UITableViewRowActionOperationDelegate> *delegates;
@property (readonly) NSIndexPath *indexPath;

@property (weak, readonly) UITableViewRowAction *object;

@end










@interface UITableViewRowAction (UIE)

@property (readonly) UITableViewRowActionOperation *nseOperation;

+ (instancetype)uieRowActionWithStyle:(UITableViewRowActionStyle)style title:(NSString *)title delegate:(id<UITableViewRowActionOperationDelegate>)delegate;

@end
