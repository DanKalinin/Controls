//
//  ScrollView.h
//  Framework
//
//  Created by Dan Kalinin on 8/22/17.
//  Copyright © 2017 Dan Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>










@interface ScrollView : UIScrollView

@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property IBInspectable BOOL handleKeyboard;

@end










@interface ScrollViewController : UIViewController

@property (nonatomic) ScrollView *view;

@end
