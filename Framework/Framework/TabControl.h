//
//  UnderscoredButtonsView.h
//  Framework
//
//  Created by Dan Kalinin on 14/11/16.
//  Copyright © 2016 Dan Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>










@interface TabControlConfiguration : UIView

@property IBInspectable CGFloat disabledAlpha;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIStackView *stackView;
@property (weak, nonatomic) IBOutlet UIView *underscoreView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end










@interface TabControl : UIControl

@property (strong, nonatomic) IBOutlet TabControlConfiguration *configuration;

@property (readonly) UIButton *button;
- (void)selectButton:(UIButton *)button animated:(BOOL)animated;

@end
