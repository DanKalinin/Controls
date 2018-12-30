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










@interface UIETableViewNumberOfSections ()

@end



@implementation UIETableViewNumberOfSections

@end










@interface UIETableViewNumberOfRowsInSection ()

@property NSInteger section;

@end



@implementation UIETableViewNumberOfRowsInSection

- (instancetype)initWithSection:(NSInteger)section {
    self = super.init;
    
    self.section = section;
    
    return self;
}

@end










@interface UIETableViewCellForRowAtIndexPath ()

@property NSIndexPath *indexPath;

@end



@implementation UIETableViewCellForRowAtIndexPath

- (instancetype)initWithIndexPath:(NSIndexPath *)indexPath {
    self = super.init;
    
    self.indexPath = indexPath;
    
    return self;
}

@end










@interface UIETableViewOperation () <UITableViewDelegate, UITableViewDataSource>

@property UIETableViewNumberOfSections *numberOfSections;
@property UIETableViewNumberOfRowsInSection *numberOfRowsInSection;
@property UIETableViewCellForRowAtIndexPath *cellForRowAtIndexPath;

@end



@implementation UIETableViewOperation

@dynamic delegates;
@dynamic object;

- (instancetype)initWithObject:(UITableView *)object {
    self = [super initWithObject:object];
    
    object.delegate = self;
    object.dataSource = self;
    
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    self.numberOfSections = UIETableViewNumberOfSections.new;
    [self.delegates uieTableViewNumberOfSections:tableView];
    return self.numberOfSections.sections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.numberOfRowsInSection = [UIETableViewNumberOfRowsInSection.alloc initWithSection:section];
    [self.delegates uieTableViewNumberOfRowsInSection:tableView];
    return self.numberOfRowsInSection.rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    self.cellForRowAtIndexPath = [UIETableViewCellForRowAtIndexPath.alloc initWithIndexPath:indexPath];
    [self.delegates uieTableViewCellForRowAtIndexPath:tableView];
    return self.cellForRowAtIndexPath.cell;
}

@end
