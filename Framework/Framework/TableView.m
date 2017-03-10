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

@end



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
    
    self.collapsedSections = [NSMutableIndexSet indexSet];
    if (self.collapsed) {
        NSRange range = NSMakeRange(0, self.numberOfSections);
        [self.collapsedSections addIndexesInRange:range];
    }
}

#pragma mark - Table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger sections = [self.originalDataSource numberOfSectionsInTableView:tableView];
    
    if (self.emptyView) {
        BOOL show = (sections == 0);
        if (sections == 1) {
            NSInteger rows = [self.originalDataSource tableView:tableView numberOfRowsInSection:0];
            show = (rows == 0);
        }
        tableView.backgroundView = show ? self.emptyView : nil;
    }
    
    return sections;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height;
    
    if (self.collapsible) {
        BOOL collapsed = [self.collapsedSections containsIndex:indexPath.section];
        if (collapsed) {
            height = 0.0;
        } else {
            height = tableView.rowHeight;
        }
    } else {
        height = tableView.rowHeight;
    }
    
    return height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    TableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.headerViewNibName];
    if (self.collapsible) {
        view.button1.tag = section;
        view.button1.selected = [self.collapsedSections containsIndex:section];
        UIImage *image = [view.button3 imageForState:UIControlStateSelected];
        [view.button3 setImage:image forState:(UIControlStateSelected | UIControlStateHighlighted)];
    }
    if ([self.originalDelegate respondsToSelector:@selector(tableView:configureHeaderView:forSection:)]) {
        [self.originalDelegate tableView:tableView configureHeaderView:view forSection:section];
    }
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return tableView.sectionHeaderHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    TableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.footerViewNibName];
    if ([self.originalDelegate respondsToSelector:@selector(tableView:configureFooterView:forSection:)]) {
        [self.originalDelegate tableView:tableView configureFooterView:view forSection:section];
    }
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    CGFloat height;
    
    if (self.collapsible) {
        BOOL collapsed = [self.collapsedSections containsIndex:section];
        if (collapsed) {
            height = tableView.sectionFooterHeight;
        } else {
            height = CGFLOAT_MIN;
        }
    } else {
        height = tableView.sectionFooterHeight;
    }
    
    return height;
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

@end










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
