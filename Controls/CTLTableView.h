//
//  CTLTableView.h
//  Controls
//
//  Created by Dan Kalinin on 6/5/18.
//

#import <UIKit/UIKit.h>

@class CTLTableViewCell, CTLTableView, CTLTableViewController;










@interface CTLTableViewCell : UITableViewCell

@end










@interface CTLTableView : UITableView

@end










@interface CTLTableViewController : UITableViewController

@property (nonatomic) CTLTableView *tableView;

@end
