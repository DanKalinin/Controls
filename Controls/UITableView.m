//
//  UITableView.m
//  Controls
//
//  Created by Dan Kalinin on 12/24/18.
//

#import "UITableView.h"










@interface UITableViewOperationNumberOfSectionsInfo ()

@end



@implementation UITableViewOperationNumberOfSectionsInfo

@end










@interface UITableViewOperationNumberOfRowsInfo ()

@property NSInteger section;

@end



@implementation UITableViewOperationNumberOfRowsInfo

- (instancetype)initWithSection:(NSInteger)section {
    self = super.init;
    if (self) {
        self.section = section;
    }
    return self;
}

@end










@interface UITableViewOperationCellForRowInfo ()

@property NSIndexPath *indexPath;

@end



@implementation UITableViewOperationCellForRowInfo

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath {
    self = super.init;
    if (self) {
        self.indexPath = indexPath;
    }
    return self;
}

@end










@interface UITableViewOperationDidSelectRowInfo ()

@property NSIndexPath *indexPath;

@end



@implementation UITableViewOperationDidSelectRowInfo

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath {
    self = super.init;
    if (self) {
        self.indexPath = indexPath;
    }
    return self;
}

@end










@interface UITableViewOperation ()

@property UITableViewOperationNumberOfSectionsInfo *numberOfSectionsInfo;
@property UITableViewOperationNumberOfRowsInfo *numberOfRowsInfo;
@property UITableViewOperationCellForRowInfo *cellForRowInfo;
@property UITableViewOperationDidSelectRowInfo *didSelectRowInfo;

@end



@implementation UITableViewOperation

@dynamic delegates;
@dynamic weakObject;

- (instancetype)initWithWeakObject:(UITableView *)weakObject {
    self = [super initWithWeakObject:weakObject];
    if (self) {
        self.weakObject.delegate = self.delegates;
        self.weakObject.dataSource = self.delegates;
    }
    return self;
}

#pragma mark - Table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    self.numberOfSectionsInfo = UITableViewOperationNumberOfSectionsInfo.new;
    [self.delegates UITableViewOperationNumberOfSections:self];
    return self.numberOfSectionsInfo.sections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.numberOfRowsInfo = [UITableViewOperationNumberOfRowsInfo.alloc initWithSection:section];
    [self.delegates UITableViewOperationNumberOfRows:self];
    return self.numberOfRowsInfo.rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    self.cellForRowInfo = [UITableViewOperationCellForRowInfo.alloc initWithIndexPath:indexPath];
    [self.delegates UITableViewOperationCellForRow:self];
    return self.cellForRowInfo.cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.didSelectRowInfo = [UITableViewOperationDidSelectRowInfo.alloc initWithIndexPath:indexPath];
    [self.delegates UITableViewOperationDidSelectRow:self];
}

#pragma mark - Table view operation

- (void)UITableViewOperationNumberOfSections:(UITableViewOperation *)operation {
    
}

- (void)UITableViewOperationNumberOfRows:(UITableViewOperation *)operation {
    
}

- (void)UITableViewOperationCellForRow:(UITableViewOperation *)operation {
    
}

- (void)UITableViewOperationDidSelectRow:(UITableViewOperation *)operation {
    
}

@end










@implementation UITableView (UIE)

@dynamic operation;

@end
