//
//  UIApplication.m
//  Controls
//
//  Created by Dan Kalinin on 12/25/18.
//

#import "UIApplication.h"










@interface UIApplicationOperation ()

@end



@implementation UIApplicationOperation

@dynamic delegates;
@dynamic object;

- (instancetype)initWithObject:(UIApplication *)object {
    self = [super initWithObject:object];
    if (self) {
        self.object.delegate = self.delegates;
    }
    return self;
}

@end










@implementation UIApplication (UIE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return UIApplicationOperation.class;
}

@end
