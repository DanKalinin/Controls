//
//  ScrollView.m
//  Framework
//
//  Created by Dan Kalinin on 8/22/17.
//  Copyright © 2017 Dan Kalinin. All rights reserved.
//

#import "ScrollView.h"
#import <Helpers/Helpers.h>










@interface ScrollView ()

@end



@implementation ScrollView

- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated {
    UIFloatRange xRange = UIFloatRangeZero;
    xRange.maximum = self.contentSize.width - self.bounds.size.width;
    
    UIFloatRange yRange = UIFloatRangeZero;
    yRange.maximum = self.contentSize.height - self.bounds.size.height;
    
    contentOffset.x = CGFloatClampToRange(contentOffset.x, xRange);
    contentOffset.y = CGFloatClampToRange(contentOffset.y, yRange);
    
    [super setContentOffset:contentOffset animated:animated];
}

#pragma mark - Notifications

- (void)keyboardWillShowNotification:(NSNotification *)note {
    BOOL local = [note.userInfo[UIKeyboardIsLocalUserInfoKey] boolValue];
    if (local) {
        CGRect frame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        NSTimeInterval duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        UIViewAnimationCurve curve = [note.userInfo[UIKeyboardAnimationCurveUserInfoKey] unsignedIntegerValue];
        
        (void)duration;
        (void)curve;
        
        self.contentInset = self.scrollIndicatorInsets = UIEdgeInsetsMake(0.0, 0.0, frame.size.height, 0.0);
        
        CGRect bottomViewFrame = UIEdgeInsetsOutsetRect(self.bottomView.frame, self.bottomView.layoutMargins);
        [self scrollRectToVisible:bottomViewFrame animated:NO];
    }
}

- (void)keyboardWillHideNotification:(NSNotification *)note {
    self.contentInset = self.scrollIndicatorInsets = UIEdgeInsetsZero;
}

@end










@interface ScrollViewController ()

@end



@implementation ScrollViewController

@dynamic view;

@end
