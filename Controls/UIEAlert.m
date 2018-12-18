//
//  UIEAlert.m
//  Controls
//
//  Created by Dan Kalinin on 12/17/18.
//

#import "UIEAlert.h"



@interface UIEAlertAction ()

@property UIAlertAction *alertAction;

@end



@implementation UIEAlertAction

@dynamic delegates;

- (instancetype)initWithTitle:(NSString *)title style:(UIAlertActionStyle)style identifier:(NSString *)identifier delegate:(id<UIEAlertActionDelegate>)delegate {
    self = [super initWithIdentifier:identifier delegate:delegate];
    if (self) {
        self.alertAction = [UIAlertAction actionWithTitle:title style:style handler:^(UIAlertAction *action) {
            [self.delegates UIEActionDidFinish:self];
            [self.delegates UIEAlertActionDidFinish:self];
        }];
    }
    return self;
}

@end
