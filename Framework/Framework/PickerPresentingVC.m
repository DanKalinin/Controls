//
//  PickerPresentingVC.m
//  Controls
//
//  Created by Dan Kalinin on 11/9/17.
//

#import "PickerPresentingVC.h"

typedef NS_ENUM(NSUInteger, PickerActionTag) {
    PickerActionTagNone,
    PickerActionTagSettings
};



@interface PickerPresentingVC ()

@property NSString *title;
@property NSString *message;

@end



@implementation PickerPresentingVC

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.contactStore = CNContactStore.new;
        self.contactEntityType = CNEntityTypeContacts;
    }
    return self;
}

- (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(VoidBlock)completion {
    if ([viewController isKindOfClass:CNContactPickerViewController.class]) {
        [self.contactStore requestAccessForEntityType:self.contactEntityType completionHandler:^(BOOL granted, NSError *error) {
            if (granted) {
                [super presentViewController:viewController animated:animated completion:completion];
            } else {
                UIAlertController *ac = [self alertControllerForPickerViewController:viewController];
                [super presentViewController:ac animated:animated completion:completion];
            }
        }];
    } else {
        [super presentViewController:viewController animated:animated completion:completion];
    }
}

#pragma mark - Helpers

- (UIAlertController *)alertControllerForPickerViewController:(UIViewController *)viewController {
    NSString *title, *message;
    if ([viewController isKindOfClass:CNContactPickerViewController.class]) {
        title = [self localize:@"Contacts access denied"];
        message = [self localize:@"You can allow access to contacts in Settings"];
    } else {
        title = [self localize:@"Access denied"];
        message = [self localize:@"You can allow access in Settings"];
    }
    
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:self.title message:self.message preferredStyle:UIAlertControllerStyleAlert];
    
    AlertAction *settingsAction = [AlertAction actionWithTitle:[self localize:@"Settings"] style:UIAlertActionStyleDefault delegate:self tag:PickerActionTagSettings];
    AlertAction *cancelAction = [AlertAction actionWithTitle:[self localize:@"Cancel"] style:UIAlertActionStyleCancel delegate:self tag:PickerActionTagNone];
    
    [ac addAction:settingsAction];
    [ac addAction:cancelAction];
    
    return ac;
}

@end
