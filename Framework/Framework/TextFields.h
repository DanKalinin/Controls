//
//  TextFields.h
//  Controls
//
//  Created by Dan Kalinin on 10/10/17.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>



@interface TextFields : UIControl

@property (strong, nonatomic) IBOutletCollection(TextField) NSArray *textFields;
@property (strong, nonatomic) IBOutletCollection(Button) NSArray *buttons;

@property IBInspectable NSString *separator;

@property (readonly) BOOL valid;
@property (readonly) NSString *text;

@end
