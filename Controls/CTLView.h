//
//  CTLView.h
//  Controls
//
//  Created by Dan Kalinin on 5/30/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class CTLView, CTLViewController;










@interface CTLView : UIView

@end










@interface CTLViewController : UIViewController

@property (nonatomic) CTLView *view;

@end










@interface UIViewController (CTL)

@property UIStoryboardSegue *segue;
@property UIAlertController *alert;

@end
