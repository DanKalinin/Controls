//
//  UIEButton.m
//  Controls
//
//  Created by Dan Kalinin on 11/18/18.
//

#import "UIEButton.h"










@interface UIEButton ()

@property UIEButtonManager *manager;

@end



@implementation UIEButton

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.manager = [UIEButtonManager.alloc initWithControl:self];
    }
    return self;
}

@end










@interface UIEButtonManager ()

@end



@implementation UIEButtonManager

@dynamic delegates;

#pragma mark - Button

- (void)UIEControlEventTouchUpInside:(UIEControlManager *)manager {
    [self.delegates UIEButtonEventTouchUpInside:self];
}

@end
