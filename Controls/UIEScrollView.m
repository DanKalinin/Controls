//
//  UIScrollView.m
//  Controls
//
//  Created by Dan Kalinin on 12/24/18.
//

#import "UIEScrollView.h"










@interface UIEScrollViewOperation ()

@end



@implementation UIEScrollViewOperation

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
    return UIEScrollViewOperation.class;
}

@end










@interface UIEScrollView ()

@end



@implementation UIEScrollView

@end
