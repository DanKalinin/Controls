//
//  UIBarButtonItem.m
//  Controls
//
//  Created by Dan Kalinin on 12/25/18.
//

#import "UIBarButtonItem.h"










@interface UIBarButtonItemOperationEventInfo ()

@property UIEvent *event;

@end



@implementation UIBarButtonItemOperationEventInfo

- (instancetype)initWithEvent:(UIEvent *)event {
    self = super.init;
    if (self) {
        self.event = event;
    }
    return self;
}

@end










@interface UIBarButtonItemOperation ()

@property UIBarButtonItemOperationEventInfo *eventInfo;

@end



@implementation UIBarButtonItemOperation

@dynamic delegates;
@dynamic weakObject;

- (instancetype)initWithWeakObject:(UIBarButtonItem *)weakObject {
    self = [super initWithWeakObject:weakObject];
    if (self) {
        self.weakObject.target = self;
        self.weakObject.action = @selector(UIBarButtonItemEventTouchUpInside:event:);
    }
    return self;
}

#pragma mark - Bar button item

- (void)UIBarButtonItemEventTouchUpInside:(UIBarButtonItem *)barButtonItem event:(UIEvent *)event {
    self.eventInfo = [UIBarButtonItemOperationEventInfo.alloc initWithEvent:event];
    [self.delegates UIBarButtonItemOperationEventTouchUpInside:self];
}

#pragma mark - Bar button item operation

- (void)UIBarButtonItemOperationEventTouchUpInside:(UIBarButtonItemOperation *)operation {
    
}

@end










@implementation UIBarButtonItem (UIE)

@end
