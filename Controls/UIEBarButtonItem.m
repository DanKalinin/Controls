//
//  UIEBarButtonItem.m
//  Controls
//
//  Created by Dan Kalinin on 12/25/18.
//

#import "UIEBarButtonItem.h"










@interface UIEBarButtonItem ()

@property UIEBarButtonItemOperation *operation;

@end



@implementation UIEBarButtonItem

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.operation = [self.operationClass.alloc initWithWeakObject:self];
    }
    return self;
}

- (Class)operationClass {
    return UIEBarButtonItemOperation.class;
}

@end










@interface UIEBarButtonItemOperation ()

@end



@implementation UIEBarButtonItemOperation

@dynamic weakObject;

@end
