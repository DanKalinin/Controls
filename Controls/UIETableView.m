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










@interface UIETableViewOperationNumberOfSectionsInfo ()

@end



@implementation UIETableViewOperationNumberOfSectionsInfo

@end










@interface UIETableViewOperationNumberOfRowsInfo ()

@property NSInteger section;

@end



@implementation UIETableViewOperationNumberOfRowsInfo

- (instancetype)initWithSection:(NSInteger)section {
    self = super.init;
    if (self) {
        self.section = section;
    }
    return self;
}

@end










@interface UIETableViewOperationCellForRowInfo ()

@property NSIndexPath *indexPath;

@end



@implementation UIETableViewOperationCellForRowInfo

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath {
    self = super.init;
    if (self) {
        self.indexPath = indexPath;
    }
    return self;
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

@property UIETableViewOperationNumberOfSectionsInfo *numberOfSectionsInfo;
@property UIETableViewOperationNumberOfRowsInfo *numberOfRowsInfo;
@property UIETableViewOperationCellForRowInfo *cellForRowInfo;
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    self.numberOfSectionsInfo = UIETableViewOperationNumberOfSectionsInfo.new;
    [self.delegates UIETableViewOperationNumberOfSections:self];
    return self.numberOfSectionsInfo.sections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.numberOfRowsInfo = [UIETableViewOperationNumberOfRowsInfo.alloc initWithSection:section];
    [self.delegates UIETableViewOperationNumberOfRows:self];
    return self.numberOfRowsInfo.rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    self.cellForRowInfo = [UIETableViewOperationCellForRowInfo.alloc initWithIndexPath:indexPath];
    [self.delegates UIETableViewOperationCellForRow:self];
    return self.cellForRowInfo.cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.didSelectRowInfo = [UIETableViewOperationDidSelectRowInfo.alloc initWithIndexPath:indexPath];
    [self.delegates UIETableViewOperationDidSelectRow:self];
}

@end










@interface UIETableViewCell ()

@property BOOL enabled;

@end



@implementation UIETableViewCell

- (void)setEnabled:(BOOL)enabled animated:(BOOL)animated {
    self.enabled = enabled;
    
    self.userInteractionEnabled = enabled;
    
    self.weakButton1.enabled = enabled;
    self.weakButton2.enabled = enabled;
}

@end










@interface UIETableViewController ()

@end



@implementation UIETableViewController

@dynamic tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView.operation.delegates addObject:self];
}

@end
