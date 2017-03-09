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
@property (weak) id <UITableViewDelegate> originalDelegate;

@property SurrogateContainer *dataSources;
@property SurrogateContainer *delegates;

@end



@implementation TableView

@dynamic backgroundView;

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.originalDataSource = self.dataSource;
    self.dataSources = [SurrogateContainer new];
    self.dataSources.objects = @[self.originalDataSource, self];
    self.dataSource = (id)self.dataSources;
    
    self.originalDelegate = self.delegate;
    self.delegates = [SurrogateContainer new];
    self.delegates.objects = @[self.originalDelegate, self];
    self.delegate = (id)self.delegates;
    
    if (self.headerViewNibName) {
        NSBundle *bundle = [NSBundle bundleWithIdentifier:self.headerViewNibIdentifier];
        UINib *nib = [UINib nibWithNibName:self.headerViewNibName bundle:bundle];
        [self registerNib:nib forHeaderFooterViewReuseIdentifier:self.headerViewNibName];
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
        self.backgroundView = show ? self.emptyView : nil;
    }
    return sections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rows = [self.originalDataSource tableView:tableView numberOfRowsInSection:section];
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.originalDataSource tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height;
    
    if (self.collapsible) {
        TableViewHeaderFooterView *view = [tableView headerViewForSection:indexPath.section];
        height = view.button1.selected ? 0.0 : tableView.rowHeight;
    } else {
        height = [self.originalDelegate tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    
    return height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    TableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.headerViewNibName];
    view.tag = section;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return tableView.sectionHeaderHeight;
}

#pragma mark - Actions

- (IBAction)onHeaderView:(UIButton *)sender {
    NSIndexSet *sections = [NSIndexSet indexSetWithIndex:sender.superview.tag];
    
    [self beginUpdates];
    [self reloadSections:sections withRowAnimation:UITableViewRowAnimationFade];
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
