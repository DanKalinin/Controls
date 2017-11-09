//
//  PickerPresentingVC.m
//  Controls
//
//  Created by Dan Kalinin on 11/9/17.
//

#import "PickerPresentingVC.h"

typedef NS_ENUM(NSInteger, PickerActionTag) {
    PickerActionTagNone,
    PickerActionTagSettings
};



@interface PickerPresentingVC ()

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
        CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:self.contactEntityType];
        [self.contactStore requestAccessForEntityType:self.contactEntityType completionHandler:^(BOOL granted, NSError *error) {
            if (granted) {
                [super presentViewController:viewController animated:animated completion:completion];
            } else if (status != CNAuthorizationStatusNotDetermined) {
                UIAlertController *ac = [self alertControllerSettings];
                ac.title = [self localize:@"Contacts access denied"];
                ac.message = [self localize:@"You can allow access to contacts in Settings"];
                [super presentViewController:ac animated:animated completion:completion];
            }
        }];
    } else {
        [super presentViewController:viewController animated:animated completion:completion];
    }
}

#pragma mark - Actions

- (void)didHandleAction:(id<Action>)action {
    if (action.tag == PickerActionTagSettings) {
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [UIApplication.sharedApplication openURL:url options:@{} completionHandler:nil];
    }
}

#pragma mark - Helpers

- (UIAlertController *)alertControllerSettings {
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:[self localize:@"Access denied"] message:[self localize:@"You can allow access in Settings"] preferredStyle:UIAlertControllerStyleAlert];
    
    AlertAction *settingsAction = [AlertAction actionWithTitle:[self localize:@"Settings"] style:UIAlertActionStyleDefault delegate:self tag:PickerActionTagSettings];
    AlertAction *cancelAction = [AlertAction actionWithTitle:[self localize:@"Cancel"] style:UIAlertActionStyleCancel delegate:self tag:PickerActionTagNone];
    
    [ac addAction:settingsAction];
    [ac addAction:cancelAction];
    
    return ac;
}

@end
