//
//  TimerControl.h
//  Controls
//
//  Created by Dan Kalinin on 11/17/17.
//

#import <UIKit/UIKit.h>
#import "View.h"










@interface TimerControl : UIControl

@property IBInspectable NSTimeInterval interval;
@property IBInspectable NSUInteger repeats;

@property (readonly) NSTimer *timer;
@property (readonly) NSRunLoop *runLoop;

@end










@interface TimerViewController : ViewController

@property (nonatomic) TimerControl *view;

@end
