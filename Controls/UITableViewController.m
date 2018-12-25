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

@dynamic weakObject;

#pragma mark - View controller operation

- (void)UIViewControllerOperationViewDidLoad:(UITableViewControllerOperation *)operation {
    [super UIViewControllerOperationViewDidLoad:self];
    
    [self.weakObject.tableView.operation.delegates addObject:self.weakObject];
}

@end










@implementation UITableViewController (UIE)

@end
