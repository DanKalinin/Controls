//
//  TableViewCell.m
//  Pods
//
//  Created by Dan Kalinin on 03.03.17.
//
//

#import "Cells.h"










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










@interface CollectionViewCell ()

@end



@implementation CollectionViewCell

@end
