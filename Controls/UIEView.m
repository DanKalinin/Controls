//
//  UIEView.m
//  Controls
//
//  Created by Dan Kalinin on 12/8/18.
//

#import "UIEView.h"










@interface UIEView ()

@property UIEViewOperation *operation;

@end



@implementation UIEView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.operation = [self.operationClass.alloc initWithWeakObject:self];
    }
    return self;
}

- (Class)operationClass {
    return UIEViewOperation.class;
}

@end










@interface UIEViewOperation ()

@end



@implementation UIEViewOperation

@dynamic weakObject;

@end
