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
@dynamic weakObject;

- (instancetype)initWithWeakObject:(UIApplication *)weakObject {
    self = [super initWithWeakObject:weakObject];
    if (self) {
        self.weakObject.delegate = self.delegates;
    }
    return self;
}

@end










@implementation UIApplication (UIE)

@end
