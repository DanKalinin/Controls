//
//  CTLAlert.h
//  Controls
//
//  Created by Dan Kalinin on 6/14/18.
//

#import <UIKit/UIKit.h>
#import "CTLAction.h"

@class CTLAlertAction;



@protocol CTLAlertActionDelegate <CTLActionDelegate>

@optional
- (void)CTLAlertActionDidEnd:(CTLAlertAction *)alertAction;

@end



@interface CTLAlertAction : CTLAction <CTLAlertActionDelegate>

@property (readonly) HLPArray<CTLAlertActionDelegate> *delegates;
@property (readonly) UIAlertAction *action;

- (instancetype)initWithTitle:(NSString *)title style:(UIAlertActionStyle)style identifier:(NSString *)identifier delegate:(id<CTLAlertActionDelegate>)delegate;

@end
