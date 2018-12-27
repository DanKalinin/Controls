//
//  UIEViewController.m
//  Controls
//
//  Created by Dan Kalinin on 12/20/18.
//

#import "UIEViewController.h"



@interface UIEViewController ()

@end



@implementation UIEViewController

@dynamic view;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.nseOperation.delegates UIViewControllerOperationViewDidLoad:self.nseOperation];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    
    self.nseOperation.prepareForSegueInfo = [UIViewControllerOperationPrepareForSegueInfo.alloc initWithSegue:segue sender:sender];
}

@end
