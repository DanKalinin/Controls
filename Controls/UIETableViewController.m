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

@dynamic tableView;

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.operation = [self.operationClass.alloc initWithViewController:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView.operation.delegates addObject:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.operation.prepareForSegueInfo = [UIViewControllerOperationPrepareForSegueInfo.alloc initWithSegue:segue sender:sender];
}

- (Class)operationClass {
    return UIETableViewControllerOperation.class;
}

@end










@interface UIETableViewControllerOperation ()

@end



@implementation UIETableViewControllerOperation

@dynamic viewController;

@end
