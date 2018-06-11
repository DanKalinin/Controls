//
//  CTLTableView.h
//  Controls
//
//  Created by Dan Kalinin on 6/5/18.
//

#import <UIKit/UIKit.h>
#import "CTLButton.h"

@class CTLTableViewCell, CTLTableView, CTLTableViewController;










@interface CTLTableViewCell : UITableViewCell

@property (weak) IBOutlet CTLButton *weakButton1;
@property (weak) IBOutlet CTLButton *weakButton2;

@property (readonly) BOOL enabled;

- (void)setEnabled:(BOOL)enabled animated:(BOOL)animated;

@end










@interface CTLTableView : UITableView

@end










@interface CTLTableViewController : UITableViewController

@property (nonatomic) CTLTableView *tableView;

@end
