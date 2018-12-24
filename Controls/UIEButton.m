//
//  UIEButton.m
//  Controls
//
//  Created by Dan Kalinin on 11/29/18.
//

#import "UIEButton.h"










@interface UIEButton ()

@property UIEButtonOperation *operation;

@end



@implementation UIEButton

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.operation = [self.operationClass.alloc initWithWeakObject:self];
    }
    return self;
}

- (Class)operationClass {
    return UIEButtonOperation.class;
}

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










@interface UIEButtonOperation ()

@end



@implementation UIEButtonOperation

@dynamic weakObject;

@end
