//
//  UIBarButtonItem.m
//  Controls
//
//  Created by Dan Kalinin on 12/25/18.
//

#import "UIBarButtonItem.h"










@interface UIBarButtonItemOperation ()

@end



@implementation UIBarButtonItemOperation

@dynamic weakObject;

- (instancetype)initWithWeakObject:(UIBarButtonItem *)weakObject {
    self = [super initWithWeakObject:weakObject];
    if (self) {
        self.weakObject.target = self;
    }
    return self;
}

@end










@implementation UIBarButtonItem (UIE)

@end
