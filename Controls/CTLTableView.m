//
//  CTLTableView.m
//  Controls
//
//  Created by Dan Kalinin on 6/5/18.
//

#import "CTLTableView.h"










@interface CTLTableViewCell ()

@property BOOL enabled;

@end



@implementation CTLTableViewCell

- (void)setEnabled:(BOOL)enabled animated:(BOOL)animated {
    self.enabled = enabled;
    
    self.userInteractionEnabled = enabled;
    
    self.weakButton1.enabled = enabled;
    self.weakButton2.enabled = enabled;
}

@end










@interface CTLTableView ()

@end



@implementation CTLTableView

@end










@interface CTLTableViewController ()

@end



@implementation CTLTableViewController

@dynamic tableView;

@end
