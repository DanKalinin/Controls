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
@dynamic object;

- (instancetype)initWithObject:(UIScrollView *)object {
    self = [super initWithObject:object];
    if (self) {
        self.object.delegate = self.delegates;
    }
    return self;
}

@end










@implementation UIScrollView (UIE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return UIScrollViewOperation.class;
}

@end
