//
//  CTLPasscodeView.h
//  Controls
//
//  Created by Dan Kalinin on 8/10/18.
//

#import <UIKit/UIKit.h>
#import "CTLControl.h"
#import "CTLLabel.h"
#import "CTLButton.h"

@class CTLPasscodeView;



@interface CTLPasscodeView : CTLControl

@property IBOutlet CTLButton *buttonDelete;

@property IBOutletCollection(CTLLabel) NSArray<CTLLabel *> *labels;
@property IBOutletCollection(CTLButton) NSArray<CTLButton *> *buttons;

@property (readonly) NSMutableString *passcode;

@end
