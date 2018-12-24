//
//  UIScrollView.m
//  Controls
//
//  Created by Dan Kalinin on 12/24/18.
//

#import "UIScrollView.h"



@interface UIScrollViewOperation ()

@end



@implementation UIScrollViewOperation

@dynamic delegates;
@dynamic weakObject;

- (instancetype)initWithWeakObject:(UIScrollView *)weakObject {
    self = [super initWithWeakObject:weakObject];
    if (self) {
        self.weakObject.delegate = self.delegates;
    }
    return self;
}

@end
