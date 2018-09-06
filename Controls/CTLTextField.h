//
//  CTLTextField.h
//  Controls
//
//  Created by Dan Kalinin on 9/1/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class CTLTextField, CTLTextFieldManager;










@protocol CTLTextFieldDelegate <UITextFieldDelegate>

@end



@interface CTLTextField : UITextField

@property (readonly) HLPArray<CTLTextFieldDelegate> *delegates;
@property (readonly) CTLTextFieldManager *manager;

@property IBInspectable BOOL clearOnBegin;
@property IBInspectable NSString *pattern;

@end










@protocol CTLTextFieldManagerDelegate <CTLTextFieldDelegate>

@end



@interface CTLTextFieldManager : HLPObject <CTLTextFieldManagerDelegate>

@end
