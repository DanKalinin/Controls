//
//  PickerControl.h
//  Framework
//
//  Created by Dan Kalinin on 18/11/16.
//  Copyright © 2016 Dan Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface PickerControl : UIControl

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property IBInspectable NSUInteger components;
@property NSArray *firstComponentObjects;
@property NSArray *secondComponentObjects;
@property NSRange secondComponentRange;
@property (readonly) id selectedFirstComponentObject;
@property (readonly) id selectedSecondComponentObject;
- (void)selectFirstComponentObject:(id)object animated:(BOOL)animated;
- (void)selectSecondComponentObject:(id)object animated:(BOOL)animated;

@end
