//
//  CTLView.h
//  Controls
//
//  Created by Dan Kalinin on 5/30/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>
#import "CTLAlert.h"

@class CTLView, CTLViewController, CTLPreviewAction;










@interface CTLView : UIView

@end










@interface CTLViewController : UIViewController

@property (nonatomic) CTLView *view;

@end










@interface UIViewController (CTL)

@property UIStoryboardSegue *segue;

@end










@protocol CTLPreviewActionDelegate <CTLActionDelegate>

@optional
- (void)CTLPreviewActionDidEnd:(CTLPreviewAction *)action;

@end



@interface CTLPreviewAction : CTLAction <CTLPreviewActionDelegate>

@property (readonly) SurrogateArray<CTLPreviewActionDelegate> *delegates;
@property (readonly) UIPreviewAction *action;
@property (readonly) UIViewController *previewViewController;

- (instancetype)initWithTitle:(NSString *)title style:(UIPreviewActionStyle)style identifier:(NSString *)identifier delegate:(id<CTLPreviewActionDelegate>)delegate;

@end
