//
//  UIEControl.m
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import "UIEControl.h"










@interface UIEControl ()

@property UIEControlOperation *operation;

@end



@implementation UIEControl

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.operation = [self.operationClass.alloc initWithWeakObject:self];
    }
    return self;
}

- (Class)operationClass {
    return UIEControlOperation.class;
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










@interface UIEControlOperation ()

@end



@implementation UIEControlOperation

@dynamic delegates;
@dynamic weakObject;

@end
