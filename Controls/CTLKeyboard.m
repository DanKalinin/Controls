//
//  CTLKeyboard.m
//  Controls
//
//  Created by Dan Kalinin on 7/7/18.
//

#import "CTLKeyboard.h"










@interface CTLKeyboardInfo ()

@property CGRect frameBegin;
@property CGRect frameEnd;
@property NSTimeInterval animationDuration;
@property UIViewAnimationCurve animationCurve;
@property BOOL isLocal;

@end



@implementation CTLKeyboardInfo

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










@interface CTLKeyboard ()

@property CTLKeyboardInfo *info;

@end



@implementation CTLKeyboard

@dynamic delegates;

+ (instancetype)shared {
    static CTLKeyboard *shared = nil;
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

- (void)cancel {
    [self.notificationCenter removeObserver:self];
    
    [self updateState:HLPOperationStateDidEnd];
}

#pragma mark - Notifications

- (void)UIKeyboardWillShowNotification:(NSNotification *)notification {
    self.info = [CTLKeyboardInfo.alloc initWithDictionary:notification.userInfo];
    [self.delegates CTLKeyboardWillShow:self];
}

- (void)UIKeyboardDidShowNotification:(NSNotification *)notification {
    self.info = [CTLKeyboardInfo.alloc initWithDictionary:notification.userInfo];
    [self.delegates CTLKeyboardDidShow:self];
}

- (void)UIKeyboardWillHideNotification:(NSNotification *)notification {
    self.info = [CTLKeyboardInfo.alloc initWithDictionary:notification.userInfo];
    [self.delegates CTLKeyboardWillHide:self];
}

- (void)UIKeyboardDidHideNotification:(NSNotification *)notification {
    self.info = [CTLKeyboardInfo.alloc initWithDictionary:notification.userInfo];
    [self.delegates CTLKeyboardDidHide:self];
}

- (void)UIKeyboardWillChangeFrameNotification:(NSNotification *)notification {
    self.info = [CTLKeyboardInfo.alloc initWithDictionary:notification.userInfo];
    [self.delegates CTLKeyboardWillChangeFrame:self];
}

- (void)UIKeyboardDidChangeFrameNotification:(NSNotification *)notification {
    self.info = [CTLKeyboardInfo.alloc initWithDictionary:notification.userInfo];
    [self.delegates CTLKeyboardDidChangeFrame:self];
}

@end
