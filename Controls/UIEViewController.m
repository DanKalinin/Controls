//
//  UIEViewController.m
//  Controls
//
//  Created by Dan Kalinin on 12/20/18.
//

#import "UIEViewController.h"










@interface UIEViewController ()

@property UIEViewControllerOperation *operation;

@end



@implementation UIEViewController

@dynamic view;

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
    return UIEViewControllerOperation.class;
}

@end










@interface UIEViewControllerOperation ()

@end



@implementation UIEViewControllerOperation

@dynamic weakObject;

@end
