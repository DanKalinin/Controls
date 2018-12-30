//
//  UIETableViewController.m
//  Controls
//
//  Created by Dan Kalinin on 12/30/18.
//

#import "UIETableViewController.h"










@implementation UITableViewController (UIE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return UIETableViewControllerOperation.class;
}

@end










@interface UIETableViewController ()

@end



@implementation UIETableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.nseOperation viewDidLoad];
}

#pragma mark - UITableViewDelegate

- (void)uieTableViewNumberOfSections:(UITableView *)tableView {
    tableView.nseOperation.numberOfSections.sections = [self numberOfSectionsInTableView:tableView];
}

- (void)uieTableViewNumberOfRowsInSection:(UITableView *)tableView {
    tableView.nseOperation.numberOfRowsInSection.rows = [self tableView:tableView numberOfRowsInSection:tableView.nseOperation.numberOfRowsInSection.section];
}

- (void)uieTableViewCellForRowAtIndexPath:(UITableView *)tableView {
    tableView.nseOperation.cellForRowAtIndexPath.cell = [self tableView:tableView cellForRowAtIndexPath:tableView.nseOperation.cellForRowAtIndexPath.indexPath];
}

@end










@interface UIETableViewControllerOperation ()

@end



@implementation UIETableViewControllerOperation

@dynamic object;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.object.tableView.nseOperation.delegates addObject:self.object];
}

@end
