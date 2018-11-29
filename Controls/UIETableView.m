//
//  UIETableView.m
//  Controls
//
//  Created by Dan Kalinin on 11/29/18.
//

#import "UIETableView.h"










@interface UIETableView ()

@property UIETableViewOperation *operation;

@end



@implementation UIETableView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.operation = [self.operationClass.alloc initWithTableView:self];
    }
    return self;
}

- (Class)operationClass {
    return UIETableViewOperation.class;
}

@end










@interface UIETableViewOperation ()

@property (weak) UIETableView *tableView;

@end



@implementation UIETableViewOperation

@dynamic delegates;

- (instancetype)initWithTableView:(UIETableView *)tableView {
    self = super.init;
    if (self) {
        self.tableView = tableView;
        self.tableView.delegate = self.delegates;
        self.tableView.dataSource = self.delegates;
    }
    return self;
}

@end
