//
//  PickerPresentingVC.h
//  Controls
//
//  Created by Dan Kalinin on 11/9/17.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>
#import <ContactsUI/ContactsUI.h>



@interface PickerPresentingVC : UIViewController

@property CNContactStore *contactStore;
@property CNEntityType contactEntityType;

- (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(VoidBlock)completion;

@end
