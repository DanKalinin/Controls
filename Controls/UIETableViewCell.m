//
//  UIETableViewCell.m
//  Controls
//
//  Created by Dan Kalinin on 1/2/19.
//

#import "UIETableViewCell.h"










@implementation UITableViewCell (UIE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return UIETableViewCellOperation.class;
}

@end










@interface UIETableViewCell ()

@end



@implementation UIETableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    [self.nseOperation setSelected:selected animated:animated];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    
    [self.nseOperation setHighlighted:highlighted animated:animated];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    
    [self.nseOperation setEditing:editing animated:animated];
}

@end










@interface UIETableViewCellOperation ()

@property BOOL enabled;

@end



@implementation UIETableViewCellOperation

@dynamic object;

- (void)setEnabled:(BOOL)enabled animated:(BOOL)animated {
    self.enabled = enabled;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    
}

@end
