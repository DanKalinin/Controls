//
//  UIEControl.m
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import "UIEControl.h"



@interface UIEControl ()

@end



@implementation UIEControl

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
