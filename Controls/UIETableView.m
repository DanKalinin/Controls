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










@interface UIETableViewOperationDidSelectRowInfo ()

@property NSIndexPath *indexPath;

@end



@implementation UIETableViewOperationDidSelectRowInfo

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath {
    self = super.init;
    if (self) {
        self.indexPath = indexPath;
    }
    return self;
}

@end










@interface UIETableViewOperation ()

@property UIETableViewOperationDidSelectRowInfo *didSelectRowInfo;

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

#pragma mark - Table view

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.didSelectRowInfo = [UIETableViewOperationDidSelectRowInfo.alloc initWithIndexPath:indexPath];
    [self.delegates UIETableViewOperationDidSelectRow:self];
}

@end
