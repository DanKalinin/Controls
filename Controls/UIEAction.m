//
//  UIEAction.m
//  Controls
//
//  Created by Dan Kalinin on 12/17/18.
//

#import "UIEAction.h"



@interface UIEAction ()

@property NSString *identifier;

@end



@implementation UIEAction

@dynamic delegates;

- (instancetype)initWithIdentifier:(NSString *)identifier delegate:(id<UIEActionDelegate>)delegate {
    self = super.init;
    if (self) {
        self.identifier = identifier;
        
        [self.delegates addObject:delegate];
    }
    return self;
}

@end
