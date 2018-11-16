//
//  UIEKeyboard.m
//  Controls
//
//  Created by Dan Kalinin on 7/7/18.
//

#import "UIEKeyboard.h"










@interface UIEKeyboardInfo ()

@property CGRect frameBegin;
@property CGRect frameEnd;
@property NSTimeInterval animationDuration;
@property UIViewAnimationCurve animationCurve;
@property BOOL isLocal;

@end



@implementation UIEKeyboardInfo

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = super.init;
    if (self) {
        self.frameBegin = [dictionary[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
        self.frameEnd = [dictionary[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        self.animationDuration = [dictionary[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        self.animationCurve = [dictionary[UIKeyboardAnimationCurveUserInfoKey] integerValue];
        self.isLocal = [dictionary[UIKeyboardIsLocalUserInfoKey] boolValue];
    }
    return self;
}

@end










@interface UIEKeyboard ()

@property UIEKeyboardInfo *info;

@end



@implementation UIEKeyboard

@dynamic delegates;

+ (instancetype)shared {
    static UIEKeyboard *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = self.new;
    });
    return shared;
}

- (void)start {
    [self.notificationCenter addObserver:self selector:@selector(UIKeyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    [self.notificationCenter addObserver:self selector:@selector(UIKeyboardDidShowNotification:) name:UIKeyboardDidShowNotification object:nil];
    [self.notificationCenter addObserver:self selector:@selector(UIKeyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
    [self.notificationCenter addObserver:self selector:@selector(UIKeyboardDidHideNotification:) name:UIKeyboardDidHideNotification object:nil];
    [self.notificationCenter addObserver:self selector:@selector(UIKeyboardWillChangeFrameNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [self.notificationCenter addObserver:self selector:@selector(UIKeyboardDidChangeFrameNotification:) name:UIKeyboardDidChangeFrameNotification object:nil];
    
    [self updateState:HLPOperationStateDidBegin];
}

#pragma mark - Notifications

- (void)UIKeyboardWillShowNotification:(NSNotification *)notification {
    self.info = [UIEKeyboardInfo.alloc initWithDictionary:notification.userInfo];
    [self.delegates UIEKeyboardWillShow:self];
}

- (void)UIKeyboardDidShowNotification:(NSNotification *)notification {
    self.info = [UIEKeyboardInfo.alloc initWithDictionary:notification.userInfo];
    [self.delegates UIEKeyboardDidShow:self];
}

- (void)UIKeyboardWillHideNotification:(NSNotification *)notification {
    self.info = [UIEKeyboardInfo.alloc initWithDictionary:notification.userInfo];
    [self.delegates UIEKeyboardWillHide:self];
}

- (void)UIKeyboardDidHideNotification:(NSNotification *)notification {
    self.info = [UIEKeyboardInfo.alloc initWithDictionary:notification.userInfo];
    [self.delegates UIEKeyboardDidHide:self];
}

- (void)UIKeyboardWillChangeFrameNotification:(NSNotification *)notification {
    self.info = [UIEKeyboardInfo.alloc initWithDictionary:notification.userInfo];
    [self.delegates UIEKeyboardWillChangeFrame:self];
}

- (void)UIKeyboardDidChangeFrameNotification:(NSNotification *)notification {
    self.info = [UIEKeyboardInfo.alloc initWithDictionary:notification.userInfo];
    [self.delegates UIEKeyboardDidChangeFrame:self];
}

@end