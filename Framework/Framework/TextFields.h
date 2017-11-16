//
//  TextFields.h
//  Controls
//
//  Created by Dan Kalinin on 10/10/17.
//

#import <UIKit/UIKit.h>
#import "View.h"



@interface TextFields : UIControl

@property (strong, nonatomic) IBOutletCollection(TextField) NSArray *textFields; // Maintainable text fields
@property (strong, nonatomic) IBOutletCollection(Button) NSArray *buttons; // Buttons to enable/disable based on input validity

@property IBInspectable NSString *separator; // . - default separator

@property NSString *text; // Text from @ textFields joined by @ separator

@property (readonly) BOOL valid; // Input validity. YES if all @ textFields are valid.

@end
