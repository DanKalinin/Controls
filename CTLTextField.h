//
//  CTLTextField.h
//  Controls
//
//  Created by Dan Kalinin on 9/1/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class CTLTextField;



@protocol CTLTextFieldDelegate <UITextFieldDelegate>

@end



@interface CTLTextField : UITextField <CTLTextFieldDelegate>

@property (readonly) HLPArray<CTLTextFieldDelegate> *delegates;

@end
