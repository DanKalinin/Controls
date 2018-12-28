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

@dynamic nseOperation;

+ (instancetype)uieActionWithTitle:(NSString *)title style:(UIAlertActionStyle)style delegate:(id<UIAlertActionOperationDelegate>)delegate {
    UIAlertAction *alertAction = [self actionWithTitle:title style:style handler:^(UIAlertAction *alertAction) {
        [alertAction.nseOperation.delegates uiAlertActionOperationDidFinish:alertAction.nseOperation];
    }];
    [alertAction.nseOperation.delegates addObject:delegate];
    return alertAction;
}

- (Class)nseOperationClass {
    return UIAlertActionOperation.class;
}

@end
