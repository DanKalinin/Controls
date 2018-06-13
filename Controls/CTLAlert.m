//
//  CTLAlert.m
//  Controls
//
//  Created by Dan Kalinin on 6/14/18.
//

#import "CTLAlert.h"



@interface CTLAlertAction ()

@property UIAlertAction *action;

@end



@implementation CTLAlertAction

@dynamic delegates;

- (instancetype)initWithTitle:(NSString *)title style:(UIAlertActionStyle)style identifier:(NSString *)identifier delegate:(id<CTLAlertActionDelegate>)delegate {
    self = [super initWithIdentifier:identifier delegate:delegate];
    if (self) {
        self.action = [UIAlertAction actionWithTitle:title style:style handler:^(UIAlertAction *action) {
            [self updateState:HLPOperationStateDidEnd];
        }];
    }
    return self;
}

#pragma mark - Helpers

- (void)updateState:(HLPOperationState)state {
    [super updateState:state];
    
    [self.delegates CTLAlertActionDidEnd:self];
}

@end
