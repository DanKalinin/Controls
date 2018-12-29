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

@dynamic delegates;
@dynamic object;

- (instancetype)initWithObject:(UIBarButtonItem *)object {
    self = [super initWithObject:object];
    if (self) {
        self.object.target = self.delegates;
        self.object.action = @selector(uiBarButtonItemTouchUpInside:event:);
    }
    return self;
}

@end










@implementation UIBarButtonItem (UIE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return UIBarButtonItemOperation.class;
}

@end
