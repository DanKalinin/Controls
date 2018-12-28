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
    
    [self.nseOperation.delegates uiControlOperationSetEnabled:self.nseOperation];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    [self.nseOperation.delegates uiControlOperationSetSelected:self.nseOperation];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    [self.nseOperation.delegates uiControlOperationSetHighlighted:self.nseOperation];
}

@end
