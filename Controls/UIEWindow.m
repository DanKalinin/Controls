//
//  UIEWindow.m
//  Controls
//
//  Created by Dan Kalinin on 12/21/18.
//

#import "UIEWindow.h"










@interface UIEWindow ()

@property UIEWindowOperation *operation;

@end



@implementation UIEWindow

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.operation = [self.operationClass.alloc initWithWindow:self];
    }
    return self;
}

- (Class)operationClass {
    return UIEWindowOperation.class;
}

@end










@interface UIEWindowOperation ()

@property (weak) UIEWindow *window;

@end



@implementation UIEWindowOperation

@dynamic delegates;

- (instancetype)initWithWindow:(UIEWindow *)window {
    self = super.init;
    if (self) {
        self.window = window;
    }
    return self;
}

@end










@interface UIEKeyboardInfo ()

@property NSDictionary *dictionary;
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
        self.dictionary = dictionary;
        
        self.frameBegin = [self.dictionary[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
        self.frameEnd = [self.dictionary[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        self.animationDuration = [self.dictionary[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        self.animationCurve = [self.dictionary[UIKeyboardAnimationCurveUserInfoKey] integerValue];
        self.isLocal = [self.dictionary[UIKeyboardIsLocalUserInfoKey] boolValue];
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

- (instancetype)init {
    self = super.init;
    if (self) {
        [self.center addObserver:self selector:@selector(UIKeyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
        [self.center addObserver:self selector:@selector(UIKeyboardDidShowNotification:) name:UIKeyboardDidShowNotification object:nil];
        [self.center addObserver:self selector:@selector(UIKeyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
        [self.center addObserver:self selector:@selector(UIKeyboardDidHideNotification:) name:UIKeyboardDidHideNotification object:nil];
        [self.center addObserver:self selector:@selector(UIKeyboardWillChangeFrameNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
        [self.center addObserver:self selector:@selector(UIKeyboardDidChangeFrameNotification:) name:UIKeyboardDidChangeFrameNotification object:nil];
    }
    return self;
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
