//
//  UIEView.m
//  Controls
//
//  Created by Dan Kalinin on 12/8/18.
//

#import "UIEView.h"










@interface UIEView ()

@end



@implementation UIEView

@end










@interface UIEViewController ()

@property UIEViewControllerOperation *operation;

@end



@implementation UIEViewController

@dynamic view;

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.operation = [self.operationClass.alloc initWithViewController:self];
    }
    return self;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.operation.prepareForSegueInfo = [UIViewControllerOperationPrepareForSegueInfo.alloc initWithSegue:segue sender:sender];
}

- (Class)operationClass {
    return UIEViewControllerOperation.class;
}

@end










@interface UIEViewControllerOperation ()

@end



@implementation UIEViewControllerOperation

@dynamic viewController;

@end
