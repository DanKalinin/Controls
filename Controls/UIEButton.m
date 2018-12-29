//
//  UIEButton.m
//  Controls
//
//  Created by Dan Kalinin on 12/24/18.
//

#import "UIEButton.h"










@interface UIEButtonOperation ()

@end



@implementation UIEButtonOperation

@dynamic delegates;
@dynamic object;

- (instancetype)initWithObject:(UIButton *)object {
    self = [super initWithObject:object];
    if (self) {
        [object addTarget:self.delegates action:@selector(uieButtonTouchUpInside:event:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

@end










@implementation UIButton (UIE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return UIEButtonOperation.class;
}

@end










@interface UIEButton ()

@end



@implementation UIEButton

@end
