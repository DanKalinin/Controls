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










@interface CTLTableViewRowAction ()

@property UITableViewRowAction *action;
@property NSIndexPath *indexPath;

@end



@implementation CTLTableViewRowAction

@dynamic delegates;

- (instancetype)initWithTitle:(NSString *)title style:(UITableViewRowActionStyle)style identifier:(NSString *)identifier delegate:(id<CTLTableViewRowActionDelegate>)delegate {
    self = [super initWithIdentifier:identifier delegate:delegate];
    if (self) {
        self.action = [UITableViewRowAction rowActionWithStyle:style title:title handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
            self.indexPath = indexPath;
            
            [self updateState:HLPOperationStateDidEnd];
        }];
    }
    return self;
}

#pragma mark - Helpers

- (void)updateState:(HLPOperationState)state {
    [super updateState:state];
    
    [self.delegates CTLTableViewRowActionDidEnd:self];
}

@end
