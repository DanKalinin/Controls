//
//  UIEButton.m
//  Controls
//
//  Created by Dan Kalinin on 11/29/18.
//

#import "UIEButton.h"



@interface UIEButton ()

@end



@implementation UIEButton

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    
    [self.operation.delegates UIControlOperationDidSetEnabled:self.operation];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    [self.operation.delegates UIControlOperationDidSetSelected:self.operation];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    [self.operation.delegates UIControlOperationDidSetHighlighted:self.operation];
}

@end
