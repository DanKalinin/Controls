//
//  TableViewCell.m
//  Pods
//
//  Created by Dan Kalinin on 03.03.17.
//
//

#import "TableView.h"










@implementation TableViewController

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = self.cells[indexPath.row];
    CGFloat height = cell.height * !cell.hidden;
    return height;
}

@end










@interface TableView () <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>

@property IBInspectable UITableViewCellSeparatorStyle defaultSeparatorStyle;

@property (weak) id <TableViewDataSource> originalDataSource;
@property (weak) id <TableViewDelegate> originalDelegate;

@property SurrogateContainer *dataSources;
@property SurrogateContainer *delegates;

@property NSMutableIndexSet *collapsedSections;
@property NSMutableSet *collapsedRows;

@property TableViewCell *sourceCell;
@property TableViewCell *destinationCell;
@property NSIndexPath *sourceIndexPath;

@end



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"

@implementation TableView

@dynamic backgroundView;

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [super setDataSource:self];
        [super setDelegate:self];
        
        self.canMoveSingleRow = YES;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.defaultSeparatorStyle = self.separatorStyle;
    
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
    
    if (self.groupCells) {
        UIPanGestureRecognizer *pgr = [UIPanGestureRecognizer.alloc initWithTarget:self action:@selector(onPan:)];
        pgr.cancelsTouchesInView = NO;
        pgr.delegate = self;
        [self addGestureRecognizer:pgr];
    }
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
    
    if (!newWindow) return;
    
    if (self.selectAllButton) {
        self.selectAllButton.selected = (self.indexPathsForSelectedRows.count == self.numberOfRows);
    }
}

#pragma mark - Accessors

- (void)setDataSource:(id<UITableViewDataSource>)dataSource {
    if (dataSource) {
        self.originalDataSource = (id)dataSource;
        self.dataSources = [SurrogateContainer new];
        self.dataSources.objects = @[dataSource, self];
        [super setDataSource:(id)self.dataSources];
    } else {
        [super setDataSource:self];
    }
}

- (void)setDelegate:(id<UITableViewDelegate>)delegate {
    if (delegate) {
        self.originalDelegate = (id)delegate;
        self.delegates = [SurrogateContainer new];
        self.delegates.objects = @[delegate, self];
        [super setDelegate:(id)self.delegates];
    } else {
        [super setDelegate:self];
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
        tableView.separatorStyle = show ? UITableViewCellSeparatorStyleNone : self.defaultSeparatorStyle;
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
    UIView *view;
    
    SEL selector = @selector(tableView:viewForHeaderInSection:);
    if ([self.originalDelegate respondsToSelector:selector]) {
        view = [self.originalDelegate tableView:tableView viewForHeaderInSection:section];
    } else {
        TableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.headerViewNibName];
        if (self.sectionsCollapsible) {
            headerView.button1.tag = section;
            headerView.button1.selected = [self.collapsedSections containsIndex:section];
            UIImage *image = [headerView.button3 imageForState:UIControlStateSelected];
            [headerView.button3 setImage:image forState:(UIControlStateSelected | UIControlStateHighlighted)];
        }
        selector = @selector(tableView:configureHeaderView:forSection:);
        if ([self.originalDataSource respondsToSelector:selector]) {
            [self.originalDataSource tableView:tableView configureHeaderView:headerView forSection:section];
        }
        view = headerView;
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
    UIView *view;
    
    SEL selector = @selector(tableView:viewForFooterInSection:);
    if ([self.originalDelegate respondsToSelector:selector]) {
        view = [self.originalDelegate tableView:tableView viewForFooterInSection:section];
    } else {
        TableViewHeaderFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.footerViewNibName];
        selector = @selector(tableView:configureFooterView:forSection:);
        if ([self.originalDataSource respondsToSelector:selector]) {
            [self.originalDataSource tableView:tableView configureFooterView:footerView forSection:section];
        }
        view = footerView;
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

// Reordering

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    BOOL canMove;
    if (self.canMoveSingleRow) {
        canMove = YES;
    } else {
        NSInteger rowsInSection = [tableView numberOfRowsInSection:indexPath.section];
        canMove = (rowsInSection > 1);
    }
    return canMove;
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
    NSIndexPath *ip;
    if (self.rowReorderingPolicy == TableViewRowReorderingPolicyNone) {
        ip = proposedDestinationIndexPath;
    } else if (self.rowReorderingPolicy == TableViewRowReorderingPolicyInSection) {
        if (proposedDestinationIndexPath.section > sourceIndexPath.section) {
            NSInteger rowsInSection = [tableView numberOfRowsInSection:sourceIndexPath.section];
            ip = [NSIndexPath indexPathForRow:(rowsInSection - 1) inSection:sourceIndexPath.section];
        } else if (proposedDestinationIndexPath.section < sourceIndexPath.section) {
            ip = [NSIndexPath indexPathForRow:0 inSection:sourceIndexPath.section];
        } else {
            ip = proposedDestinationIndexPath;
        }
    }
    return ip;
}

#pragma mark - Gesture recognizer

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
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
    
    SEL selector = @selector(tableView:didToggleSelectAllButton:);
    if ([self.originalDelegate respondsToSelector:selector]) {
        [self.originalDelegate tableView:self didToggleSelectAllButton:sender];
    }
}

- (void)onPan:(UIPanGestureRecognizer *)pgr {
    if (pgr.state == UIGestureRecognizerStateBegan) {
        
        CGPoint location = [pgr locationInView:self];
        UIView *view = [self hitTest:location withEvent:nil];
        if (view && [NSStringFromClass(view.class) isEqualToString:@"UITableViewCellReorderControl"]) {
            UIView *superview = view.superview;
            if (superview && [superview isKindOfClass:TableViewCell.class]) {
                self.sourceCell = (TableViewCell *)view.superview;
                self.sourceIndexPath = [self indexPathForCell:self.sourceCell];
                self.destinationCell = nil;
            }
        }
        
    } else if (pgr.state >= UIGestureRecognizerStateChanged) {
        
        if (!self.sourceCell) return;
        
        CGFloat xCenter = CGRectGetMidX(self.sourceCell.frame);
        CGFloat yTop = CGRectGetMinY(self.sourceCell.frame) + self.sourceCell.groupInset;
        CGFloat yBottom = CGRectGetMaxY(self.sourceCell.frame) - self.sourceCell.groupInset;
        
        CGPoint pTop = CGPointMake(xCenter, yTop);
        CGPoint pBottom = CGPointMake(xCenter, yBottom);
        
        TableViewCell *destinationCell = nil;
        for (TableViewCell *cell in self.visibleCells) {
            if ([cell isEqual:self.sourceCell]) continue;
            if (CGRectContainsPoint(cell.frame, pTop)) {
                destinationCell = cell;
                break;
            }
            if (CGRectContainsPoint(cell.frame, pBottom)) {
                destinationCell = cell;
                break;
            }
        }
        
        if (pgr.state == UIGestureRecognizerStateChanged) {
            if (destinationCell && ![destinationCell isEqual:self.destinationCell]) {
                self.destinationCell = destinationCell;
                
                SEL selector = @selector(tableView:canGroupRowAtIndexPath:withIndexPath:);
                if ([self.originalDataSource respondsToSelector:selector]) {
                    NSIndexPath *destinationIndexPath = [self indexPathForCell:destinationCell];
                    BOOL canGroup = [self.originalDataSource tableView:self canGroupRowAtIndexPath:self.sourceIndexPath withIndexPath:destinationIndexPath];
                    if (canGroup) {
                        selector = @selector(tableView:indexPath:didIntersect:indexPath:);
                        if ([self.originalDelegate respondsToSelector:selector]) {
                            [self.originalDelegate tableView:self indexPath:self.sourceIndexPath didIntersect:YES indexPath:destinationIndexPath];
                        }
                    }
                }
            } else if (self.destinationCell && ![self.destinationCell isEqual:destinationCell]) {
                SEL selector = @selector(tableView:indexPath:didIntersect:indexPath:);
                if ([self.originalDelegate respondsToSelector:selector]) {
                    NSIndexPath *destinationIndexPath = [self indexPathForCell:self.destinationCell];
                    [self.originalDelegate tableView:self indexPath:self.sourceIndexPath didIntersect:NO indexPath:destinationIndexPath];
                }
                
                self.destinationCell = destinationCell;
            }
        } else {
            if (destinationCell) {
                SEL selector = @selector(tableView:canGroupRowAtIndexPath:withIndexPath:);
                if ([self.originalDataSource respondsToSelector:selector]) {
                    NSIndexPath *destinationIndexPath = [self indexPathForCell:destinationCell];
                    BOOL canGroup = [self.originalDataSource tableView:self canGroupRowAtIndexPath:self.sourceIndexPath withIndexPath:destinationIndexPath];
                    if (canGroup) {
                        selector = @selector(tableView:groupRowAtIndexPath:withIndexPath:);
                        if ([self.originalDataSource respondsToSelector:selector]) {
                            NSIndexPath *destinationIndexPath = [self indexPathForCell:destinationCell];
                            [self.originalDataSource tableView:self groupRowAtIndexPath:self.sourceIndexPath withIndexPath:destinationIndexPath];
                        }
                    }
                }
            }
            
            self.sourceCell = nil;
        }
        
    }
}

#pragma mark - Helpers

@end

#pragma clang diagnostic pop










@interface TableViewHeaderFooterView ()

@end



@implementation TableViewHeaderFooterView

@end










@interface TableViewCell ()

@property UITableViewCellStateMask state;

@end



@implementation TableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (self.selectedAccessoryType == self.defaultAccessoryType) return;
    
    self.accessoryType = selected ? self.selectedAccessoryType : self.defaultAccessoryType;
}

- (void)willTransitionToState:(UITableViewCellStateMask)state {
    [super willTransitionToState:state];
    
    self.state = state;
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
