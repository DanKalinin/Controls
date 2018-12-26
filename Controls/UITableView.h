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

@protocol UITableViewOperationDelegate;










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
- (void)UITableViewOperationNumberOfSections:(UITableViewOperation *)operation;
- (void)UITableViewOperationNumberOfRows:(UITableViewOperation *)operation;
- (void)UITableViewOperationCellForRow:(UITableViewOperation *)operation;
- (void)UITableViewOperationDidSelectRow:(UITableViewOperation *)operation;

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

@property (readonly) UITableViewOperation *operation;

@end
