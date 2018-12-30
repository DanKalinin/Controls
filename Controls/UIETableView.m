//
//  UIETableView.m
//  Controls
//
//  Created by Dan Kalinin on 12/30/18.
//

#import "UIETableView.h"










@implementation UITableView (UIE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return UIETableViewOperation.class;
}

@end










@interface UIETableView ()

@end



@implementation UIETableView

@end










@interface UIETableViewOperation () <UITableViewDelegate, UITableViewDataSource>

@end



@implementation UIETableViewOperation

@dynamic object;

- (instancetype)initWithObject:(UITableView *)object {
    self = [super initWithObject:object];
    
    object.delegate = self;
    object.dataSource = self;
    
    return self;
}

@end
