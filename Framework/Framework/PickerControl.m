//
//  PickerControl.m
//  Framework
//
//  Created by Dan Kalinin on 18/11/16.
//  Copyright © 2016 Dan Kalinin. All rights reserved.
//

#import "PickerControl.h"



@interface PickerControl () <UIPickerViewDataSource, UIPickerViewDelegate>

@end



@implementation PickerControl

#pragma mark - Accessors

- (void)setPickerView:(UIPickerView *)pickerView {
    _pickerView = pickerView;
    pickerView.dataSource = self;
    pickerView.delegate = self;
}

#pragma mark - Picker view

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return self.components;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSUInteger count = [self objectsForComponent:component].count;
    return count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    id object = [self objectForRow:row forComponent:component];
    if ([object isKindOfClass:NSString.class]) return object;
    return nil;
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    id object = [self objectForRow:row forComponent:component];
    if ([object isKindOfClass:NSAttributedString.class]) return object;
    return nil;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    id object = [self objectForRow:row forComponent:component];
    if ([object isKindOfClass:UIView.class]) return object;
    return nil;
}

#pragma mark - Helpers

- (NSArray *)objectsForComponent:(NSInteger)component {
    if (component == 0) {
        return self.firstComponentObjects;
    } else if (component == 1) {
        return self.secondComponentObjects;
    }
    return nil;
}

- (id)objectForRow:(NSInteger)row forComponent:(NSInteger)component {
    id object = [self objectsForComponent:component][row];
    return object;
}

@end
