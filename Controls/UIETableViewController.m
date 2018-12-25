//
//  UIETableViewController.m
//  Controls
//
//  Created by Dan Kalinin on 12/20/18.
//

#import "UIETableViewController.h"










@interface UIETableViewController ()

@property UIETableViewControllerOperation *operation;

@end



@implementation UIETableViewController

@dynamic view;
@dynamic tableView;

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.operation = [self.operationClass.alloc initWithWeakObject:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.operation.delegates UIViewControllerOperationViewDidLoad:self.operation];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    
    self.operation.prepareForSegueInfo = [UIViewControllerOperationPrepareForSegueInfo.alloc initWithSegue:segue sender:sender];
}

- (Class)operationClass {
    return UIETableViewControllerOperation.class;
}

@end










@interface UIETableViewControllerOperation ()

@end



@implementation UIETableViewControllerOperation

@dynamic weakObject;

@end
