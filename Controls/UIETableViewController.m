//
//  UIETableViewController.m
//  Controls
//
//  Created by Dan Kalinin on 12/20/18.
//

#import "UIETableViewController.h"



@interface UIETableViewController ()

@end



@implementation UIETableViewController

@dynamic view;
@dynamic tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.nseOperation.delegates uiViewControllerViewDidLoad:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    
    self.nseOperation.prepareForSegueInfo = [UIViewControllerOperationPrepareForSegueInfo.alloc initWithSegue:segue sender:sender];
}

@end
