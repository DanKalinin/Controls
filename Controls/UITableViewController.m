//
//  UITableViewController.m
//  Controls
//
//  Created by Dan Kalinin on 12/25/18.
//

#import "UITableViewController.h"










@interface UITableViewControllerOperation ()

@end



@implementation UITableViewControllerOperation

@dynamic object;

#pragma mark - View controller operation

- (void)UIViewControllerOperationViewDidLoad:(UITableViewControllerOperation *)operation {
    [super UIViewControllerOperationViewDidLoad:self];
    
    [self.object.tableView.nseOperation.delegates addObject:self.object];
}

@end










@implementation UITableViewController (UIE)

- (Class)nseOperationClass {
    return UITableViewControllerOperation.class;
}

@end
