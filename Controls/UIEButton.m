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
    
    [self.nseOperation.delegates uieControl:self setEnabled:enabled];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    [self.nseOperation.delegates uieControl:self setSelected:selected];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    [self.nseOperation.delegates uieControl:self setHighlighted:highlighted];
}

@end
