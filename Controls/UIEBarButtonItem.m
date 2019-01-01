//
//  UIEBarButtonItem.m
//  Controls
//
//  Created by Dan Kalinin on 12/31/18.
//

#import "UIEBarButtonItem.h"










@implementation UIBarButtonItem (UIE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return UIEBarButtonItemOperation.class;
}

@end










@interface UIEBarButtonItem ()

@end



@implementation UIEBarButtonItem

@end










@interface UIEBarButtonItemOperation ()

@property (weak) UIEvent *event;

@end



@implementation UIEBarButtonItemOperation

@dynamic delegates;
@dynamic object;

- (instancetype)initWithObject:(UIBarButtonItem *)object {
    self = [super initWithObject:object];
    
    object.target = self;
    object.action = @selector(touchUpInside:event:);
    
    return self;
}

- (void)touchUpInside:(UIBarButtonItem *)sender event:(UIEvent *)event {
    self.event = event.nseAutorelease;
    [self.delegates uieBarButtonItemTouchUpInside:sender];
}

@end
