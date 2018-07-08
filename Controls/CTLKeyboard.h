//
//  CTLKeyboard.h
//  Controls
//
//  Created by Dan Kalinin on 7/7/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class CTLKeyboardInfo, CTLKeyboard;










@interface CTLKeyboardInfo : HLPObject

@property (readonly) CGRect frameBegin;
@property (readonly) CGRect frameEnd;
@property (readonly) NSTimeInterval animationDuration;
@property (readonly) UIViewAnimationCurve animationCurve;
@property (readonly) BOOL isLocal;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end










@protocol CTLKeyboardDelegate <HLPOperationDelegate>

@optional
- (void)CTLKeyboardDidUpdateState:(CTLKeyboard *)keyboard;

- (void)CTLKeyboardDidBegin:(CTLKeyboard *)keyboard;
- (void)CTLKeyboardDidEnd:(CTLKeyboard *)keyboard;

- (void)CTLKeyboardWillShow:(CTLKeyboard *)keyboard;
- (void)CTLKeyboardDidShow:(CTLKeyboard *)keyboard;
- (void)CTLKeyboardWillHide:(CTLKeyboard *)keyboard;
- (void)CTLKeyboardDidHide:(CTLKeyboard *)keyboard;
- (void)CTLKeyboardWillChangeFrame:(CTLKeyboard *)keyboard;
- (void)CTLKeyboardDidChangeFrame:(CTLKeyboard *)keyboard;

@end



@interface CTLKeyboard : HLPOperation <CTLKeyboardDelegate>

@property (readonly) HLPArray<CTLKeyboardDelegate> *delegates;
@property (readonly) CTLKeyboardInfo *info;

@end
