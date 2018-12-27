//
//  UIETableView.m
//  Controls
//
//  Created by Dan Kalinin on 11/29/18.
//

#import "UIETableView.h"










@interface UIETableView ()

@end



@implementation UIETableView

@end










@interface UIETableViewRowAction ()

@property UITableViewRowAction *rowAction;
@property NSIndexPath *indexPath;

@end



@implementation UIETableViewRowAction

@dynamic delegates;

- (instancetype)initWithStyle:(UITableViewRowActionStyle)style title:(NSString *)title identifier:(NSString *)identifier delegate:(id<UIETableViewRowActionDelegate>)delegate {
    self = [super initWithIdentifier:identifier delegate:delegate];
    if (self) {
        self.rowAction = [UITableViewRowAction rowActionWithStyle:style title:title handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
            self.indexPath = indexPath;
            
            [self.delegates UIEActionDidFinish:self];
            [self.delegates UIETableViewRowActionDidFinish:self];
        }];
    }
    return self;
}

@end
