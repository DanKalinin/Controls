//
//  TableViewCell.m
//  Pods
//
//  Created by Dan Kalinin on 03.03.17.
//
//

#import "Cells.h"










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










@interface CollectionViewCell ()

@end



@implementation CollectionViewCell

@end
