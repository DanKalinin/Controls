//
//  ScrollView.h
//  Framework
//
//  Created by Dan Kalinin on 8/22/17.
//  Copyright © 2017 Dan Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ScrollView;










@protocol ScrollViewDelegate <UIScrollViewDelegate>

@optional
- (void)scrollViewDidEndScrolling:(ScrollView *)scrollView;

@end










@interface ScrollView : UIScrollView // To handle the keyboard set @ keyboardWillShowNotification, @ keyboardWillHideNotification to YES in IB

@property (weak, nonatomic) IBOutlet UIView *bottomView;

- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;

@end










@interface ScrollViewController : UIViewController

@property (nonatomic) ScrollView *view;

@end
