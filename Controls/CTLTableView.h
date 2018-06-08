//
//  CTLTableView.h
//  Controls
//
//  Created by Dan Kalinin on 6/5/18.
//

#import <UIKit/UIKit.h>

@class CTLTableView, CTLTableViewController;










@interface CTLTableView : UITableView

@end










@interface CTLTableViewController : UITableViewController

@property (nonatomic) CTLTableView *tableView;

@end
