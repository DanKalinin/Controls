//
//  CTLPasscodeView.h
//  Controls
//
//  Created by Dan Kalinin on 8/10/18.
//

#import <UIKit/UIKit.h>
#import "CTLControl.h"
#import "CTLLabel.h"
//#import "CTLButton.h"

@class CTLPasscodeView;



@interface CTLPasscodeView : CTLControl

@property IBOutlet CTLLabel *labelError;
@property IBOutlet UIButton *buttonDelete;

@property IBOutletCollection(CTLLabel) NSArray<CTLLabel *> *labels;
@property IBOutletCollection(UIButton) NSArray<UIButton *> *buttons;

@property (readonly) NSMutableString *passcode;
@property (readonly) UINotificationFeedbackGenerator *notificationFeedbackGenerator;

- (void)reset;
- (void)resetWithError:(NSError *)error completion:(HLPVoidBlock)completion;

@end
