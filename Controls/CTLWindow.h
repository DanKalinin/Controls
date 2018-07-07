//
//  CTLWindow.h
//  Controls
//
//  Created by Dan Kalinin on 7/7/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class CTLWindow, CTLKeyboardInfo;










@interface CTLWindow : UIWindow

@end










@interface CTLKeyboardInfo : HLPObject

@property (readonly) CGRect frameBegin;
@property (readonly) CGRect frameEnd;
@property (readonly) NSTimeInterval animationDuration;
@property (readonly) UIViewAnimationCurve animationCurve;
@property (readonly) BOOL isLocal;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
