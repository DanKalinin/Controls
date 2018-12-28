//
//  UIBarButtonItem.m
//  Controls
//
//  Created by Dan Kalinin on 12/25/18.
//

#import "UIBarButtonItem.h"










@interface UIBarButtonItemOperationInfo ()

@property UIEvent *event;

@end



@implementation UIBarButtonItemOperationInfo

- (instancetype)initWithEvent:(UIEvent *)event {
    self = super.init;
    if (self) {
        self.event = event;
    }
    return self;
}

@end










@interface UIBarButtonItemOperation ()

@property UIBarButtonItemOperationInfo *info;

@end



@implementation UIBarButtonItemOperation

@dynamic delegates;
@dynamic object;

- (instancetype)initWithObject:(UIBarButtonItem *)object {
    self = [super initWithObject:object];
    if (self) {
        self.object.target = self;
        self.object.action = @selector(uiBarButtonItemTouchUpInside:event:);
    }
    return self;
}

#pragma mark - Bar button item

- (void)uiBarButtonItemTouchUpInside:(UIBarButtonItem *)barButtonItem event:(UIEvent *)event {
    self.info = [UIBarButtonItemOperationInfo.alloc initWithEvent:event];
    [self.delegates uiBarButtonItemOperationTouchUpInside:self];
}

- (void)uiBarButtonItemOperationTouchUpInside:(UIBarButtonItemOperation *)operation {
    
}

@end










@implementation UIBarButtonItem (UIE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return UIBarButtonItemOperation.class;
}

@end
