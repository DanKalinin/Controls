//
//  UIAlertController.m
//  Controls
//
//  Created by Dan Kalinin on 12/27/18.
//

#import "UIAlertController.h"










@interface UIAlertActionOperation ()

@property NSString *identifier;

@end



@implementation UIAlertActionOperation

@dynamic delegates;
@dynamic object;

@end










@implementation UIAlertAction (UIE)

@dynamic operation;

+ (instancetype)actionWithTitle:(NSString *)title style:(UIAlertActionStyle)style identifier:(NSString *)identifier delegate:(id<UIAlertActionOperationDelegate>)delegate {
    UIAlertAction *action = [self actionWithTitle:title style:style handler:^(UIAlertAction *action) {
        [action.operation.delegates UIAlertActionOperationDidFinish:action.operation];
    }];
    action.operation.identifier = identifier;
    [action.operation.delegates addObject:delegate];
    return action;
}

- (Class)operationClass {
    return UIAlertActionOperation.class;
}

@end
