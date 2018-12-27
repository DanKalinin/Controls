//
//  UIAlertController.m
//  Controls
//
//  Created by Dan Kalinin on 12/27/18.
//

#import "UIAlertController.h"










@interface UIAlertActionOperation ()

@end



@implementation UIAlertActionOperation

@dynamic delegates;
@dynamic object;

@end










@implementation UIAlertAction (UIE)

@dynamic operation;

+ (instancetype)actionWithTitle:(NSString *)title style:(UIAlertActionStyle)style delegate:(id<UIAlertActionOperationDelegate>)delegate {
    UIAlertAction *alertAction = [self actionWithTitle:title style:style handler:^(UIAlertAction *alertAction) {
        [alertAction.operation.delegates UIAlertActionOperationDidFinish:alertAction.operation];
    }];
    [alertAction.operation.delegates addObject:delegate];
    return alertAction;
}

- (Class)operationClass {
    return UIAlertActionOperation.class;
}

@end
