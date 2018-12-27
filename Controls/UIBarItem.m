//
//  UIBarItem.m
//  Controls
//
//  Created by Dan Kalinin on 12/25/18.
//

#import "UIBarItem.h"










@interface UIBarItemOperation ()

@end



@implementation UIBarItemOperation

@dynamic object;

@end










@implementation UIBarItem (UIE)

- (Class)nseOperationClass {
    return UIBarItemOperation.class;
}

@end
