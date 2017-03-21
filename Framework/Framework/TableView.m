//
//  TableViewCell.m
//  Pods
//
//  Created by Dan Kalinin on 03.03.17.
//
//

#import "TableView.h"










@interface TableView () <UITableViewDataSource, UITableViewDelegate>

@property (weak) id <UITableViewDataSource> originalDataSource;
@property (weak) id <TableViewDelegate> originalDelegate;

@property SurrogateContainer *dataSources;
@property SurrogateContainer *delegates;

@property NSMutableIndexSet *collapsedSections;
@property NSMutableSet *collapsedRows;

@end



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"

@implementation TableView

@dynamic backgroundView;

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.originalDataSource = self.dataSource;
    self.dataSources = [SurrogateContainer new];
    self.dataSources.objects = @[self.originalDataSource, self];
    self.dataSource = (id)self.dataSources;
    
    self.originalDelegate = (id)self.delegate;
    self.delegates = [SurrogateContainer new];
    self.delegates.objects = @[self.originalDelegate, self];
    self.delegate = (id)self.delegates;
    
    self.collapsedSections = [NSMutableIndexSet indexSet];
    self.collapsedRows = [NSMutableSet set];
    
    if (self.headerViewNibName) {
        NSBundle *bundle = [NSBundle bundleWithIdentifier:self.headerViewNibIdentifier];
        UINib *nib = [UINib nibWithNibName:self.headerViewNibName bundle:bundle];
        [self registerNib:nib forHeaderFooterViewReuseIdentifier:self.headerViewNibName];
    }
    
    if (self.footerViewNibName) {
        NSBundle *bundle = [NSBundle bundleWithIdentifier:self.footerViewNibIdentifier];
        UINib *nib = [UINib nibWithNibName:self.footerViewNibName bundle:bundle];
        [self registerNib:nib forHeaderFooterViewReuseIdentifier:self.footerViewNibName];
    }
    
    [self.selectAllButton addTarget:self action:@selector(onSelectAll:) forControlEvents:UIControlEventValueChanged];
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    [super didMoveToSuperview];
    
    if (!newWindow) return;
    
    if (self.selectAllButton) {
        self.selectAllButton.selected = (self.indexPathsForSelectedRows.count == self.numberOfRows);
    }
}

#pragma mark - Table view

- (void)reloadData {
    [super reloadData];
    
    if (self.sectionsCollapsed) {
        NSRange range = NSMakeRange(0, self.numberOfSections);
        [self.collapsedSections addIndexesInRange:range];
    }
    
    if (self.rowsCollapsed) {
        [self.collapsedRows addObjectsFromArray:self.indexPaths];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger sections;
    
    SEL selector = @selector(numberOfSectionsInTableView:);
    if ([self.originalDataSource respondsToSelector:selector]) {
        sections = [self.originalDataSource numberOfSectionsInTableView:tableView];
    } else {
        sections = tableView.numberOfSections;
    }
    
    if (self.emptyView) {
        BOOL show = (sections == 0);
        if (sections == 1) {
            NSInteger rows;
            
            selector = @selector(tableView:numberOfRowsInSection:);
            if ([self.originalDataSource respondsToSelector:selector]) {
                rows = [self.originalDataSource tableView:tableView numberOfRowsInSection:0];
            } else {
                rows = [tableView numberOfRowsInSection:0];
            }
            
            show = (rows == 0);
        }
        
        tableView.backgroundView = show ? self.emptyView : nil;
    }
    
    return sections;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sectionsCollapsible) {
        BOOL collapsed = [self.collapsedSections containsIndex:indexPath.section];
        if (collapsed) {
            return 0.0;
        }
    }
    
    CGFloat height = tableView.rowHeight;
    
    SEL selector;
    if (self.rowsCollapsible) {
        BOOL collapsed = [self.collapsedRows containsObject:indexPath];
        if (collapsed) {
            selector = @selector(tableView:heightForCollapsedRowAtIndexPath:);
            if ([self.originalDelegate respondsToSelector:selector]) {
                height = [self.originalDelegate tableView:tableView heightForCollapsedRowAtIndexPath:indexPath];
            }
        } else {
            selector = @selector(tableView:heightForExpandedRowAtIndexPath:);
            if ([self.originalDelegate respondsToSelector:selector]) {
                height = [self.originalDelegate tableView:tableView heightForExpandedRowAtIndexPath:indexPath];
            }
        }
    } else {
        selector = @selector(tableView:heightForRowAtIndexPath:);
        if ([self.originalDelegate respondsToSelector:selector]) {
            height = [self.originalDelegate tableView:tableView heightForRowAtIndexPath:indexPath];
        }
    }
    
    return height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    TableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.headerViewNibName];
    if (self.sectionsCollapsible) {
        view.button1.tag = section;
        view.button1.selected = [self.collapsedSections containsIndex:section];
        UIImage *image = [view.button3 imageForState:UIControlStateSelected];
        [view.button3 setImage:image forState:(UIControlStateSelected | UIControlStateHighlighted)];
    }
    SEL selector = @selector(tableView:configureHeaderView:forSection:);
    if ([self.originalDelegate respondsToSelector:selector]) {
        [self.originalDelegate tableView:tableView configureHeaderView:view forSection:section];
    }
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    CGFloat height;
    
    SEL selector = @selector(tableView:heightForHeaderInSection:);
    if ([self.originalDelegate respondsToSelector:selector]) {
        height = [self.originalDelegate tableView:tableView heightForHeaderInSection:section];
    } else {
        height = tableView.sectionHeaderHeight;
    }
    
    return height;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    TableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.footerViewNibName];
    if ([self.originalDelegate respondsToSelector:@selector(tableView:configureFooterView:forSection:)]) {
        [self.originalDelegate tableView:tableView configureFooterView:view forSection:section];
    }
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (self.sectionsCollapsible) {
        BOOL collapsed = [self.collapsedSections containsIndex:section];
        if (!collapsed) {
            return CGFLOAT_MIN;
        }
    }
    
    CGFloat height;
    
    SEL selector = @selector(tableView:heightForFooterInSection:);
    if ([self.originalDelegate respondsToSelector:selector]) {
        height = [self.originalDelegate tableView:tableView heightForFooterInSection:section];
    } else {
        height = tableView.sectionFooterHeight;
    }
    
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectAllButton.selected = (self.indexPathsForSelectedRows.count == self.numberOfRows);
    
    if (self.rowsCollapsible) {
        if ([self.collapsedRows containsObject:indexPath]) {
            [self.collapsedRows removeObject:indexPath];
        } else {
            [self.collapsedRows addObject:indexPath];
        }
        
        [tableView beginUpdates];
        [tableView endUpdates];
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectAllButton.selected = NO;
    
    if (self.rowsCollapsible) {
        [self.collapsedRows addObject:indexPath];
        
        [tableView beginUpdates];
        [tableView endUpdates];
    }
}

#pragma mark - Actions

- (IBAction)onHeaderView:(UIButton *)sender {
    if (sender.selected) {
        [self.collapsedSections addIndex:sender.tag];
    } else {
        [self.collapsedSections removeIndex:sender.tag];
    }
    
    [self beginUpdates];
    [self endUpdates];
}

- (void)onSelectAll:(Button *)sender {
    for (NSInteger section = 0; section < self.numberOfSections; section++) {
        NSInteger rows = [self numberOfRowsInSection:section];
        for (NSInteger row = 0; row < rows; row++) {
            NSIndexPath *ip = [NSIndexPath indexPathForRow:row inSection:section];
            if (sender.selected) {
                [self selectRowAtIndexPath:ip animated:YES scrollPosition:UITableViewScrollPositionNone];
            } else {
                [self deselectRowAtIndexPath:ip animated:YES];
            }
        }
    }
}

@end

#pragma clang diagnostic pop










@interface TableViewHeaderFooterView ()

@end



@implementation TableViewHeaderFooterView

@end










@interface TableViewCell ()

@property UITableViewCellAccessoryType defaultAccessoryType;

@end



@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.defaultAccessoryType = self.accessoryType;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.accessoryType = selected ? self.selectedAccessoryType : self.defaultAccessoryType;
}

@end










@interface TableViewCellVerticalSeparator ()

@end



@implementation TableViewCellVerticalSeparator

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.topColor = [UIColor whiteColor];
        self.centerColor = [UIColor colorWithHexString:@"c8c7cc"];
        self.bottomColor = self.centerColor;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.colors = @[(id)self.topColor.CGColor, (id)self.centerColor.CGColor, (id)self.bottomColor.CGColor];
    self.layer.startPoint = CGPointZero;
    self.layer.endPoint = CGPointMake(0.0, 1.0);
}

@end
