//
//  CTLAction.m
//  Controls
//
//  Created by Dan Kalinin on 6/14/18.
//

#import "CTLAction.h"



@interface CTLAction ()

@property NSString *identifier;

@end



@implementation CTLAction

@dynamic delegates;

- (instancetype)initWithIdentifier:(NSString *)identifier delegate:(id<CTLActionDelegate>)delegate {
    self = super.init;
    if (self) {
        self.identifier = identifier;
        
        [self.delegates addObject:delegate];
    }
    return self;
}

#pragma mark - Helpers

- (void)updateState:(HLPOperationState)state {
    [self.delegates CTLActionDidEnd:self];
}

@end
