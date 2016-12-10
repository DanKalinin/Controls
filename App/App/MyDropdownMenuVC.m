//
//  MyDropdownMenuVC.m
//  App
//
//  Created by Dan Kalinin on 12/9/16.
//  Copyright © 2016 Dan Kalinin. All rights reserved.
//

#import "MyDropdownMenuVC.h"



@implementation MyDropdownMenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"Red"];
    [self showViewController:vc];
}

@end
