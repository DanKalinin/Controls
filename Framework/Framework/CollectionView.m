//
//  CollectionView.m
//  Framework
//
//  Created by Dan Kalinin on 10.03.17.
//  Copyright © 2017 Dan Kalinin. All rights reserved.
//

#import "CollectionView.h"



@interface CollectionViewCell ()

@end



@implementation CollectionViewCell

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    self.button1.selected = selected;
}

@end
