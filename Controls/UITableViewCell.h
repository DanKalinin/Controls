//
//  UITableViewCell.h
//  Controls
//
//  Created by Dan Kalinin on 12/28/18.
//

#import <UIKit/UIKit.h>
#import "UIEView.h"

@class UITableViewCellOperation;

@protocol UITableViewCellOperationDelegate;










@protocol UITableViewCellOperationDelegate <UIEViewOperationDelegate>

@optional
- (void)uiTableViewCellOperationSetEnabled:(UITableViewCellOperation *)operation;

- (void)uieTableViewCell:(UITableViewCell *)tableViewCell setEnabled:(BOOL)enabled animated:(BOOL)animated;

@end



@interface UITableViewCellOperation : UIEViewOperation <UITableViewCellOperationDelegate>

@property (readonly) BOOL enabled;

@property (weak, readonly) UITableViewCell *object;

- (void)setEnabled:(BOOL)enabled animated:(BOOL)animated;

@end










@interface UITableViewCell (UIE)

@property (readonly) UITableViewCellOperation *nseOperation;

@property (weak) IBOutlet UIButton *uieWeakButton1;
@property (weak) IBOutlet UIButton *uieWeakButton2;

@property (weak) IBOutlet UITextField *uieWeakTextField1;

@property (weak) IBOutlet UIActivityIndicatorView *uieWeakActivityIndicatorView1;

@end
