//
//  UIWindow.m
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import "UIEWindow.h"










@interface UIWindowOperation ()

@end



@implementation UIWindowOperation

@dynamic delegates;
@dynamic object;

- (instancetype)initWithObject:(UIWindow *)object {
    self = [super initWithObject:object];
    if (self) {
        [self.center addObserver:self.delegates selector:@selector(uiWindowDidBecomeVisibleNotification:) name:UIWindowDidBecomeVisibleNotification object:self.object];
        [self.center addObserver:self.delegates selector:@selector(uiWindowDidBecomeHiddenNotification:) name:UIWindowDidBecomeHiddenNotification object:self.object];
        [self.center addObserver:self.delegates selector:@selector(uiWindowDidBecomeKeyNotification:) name:UIWindowDidBecomeKeyNotification object:self.object];
        [self.center addObserver:self.delegates selector:@selector(uiWindowDidResignKeyNotification:) name:UIWindowDidResignKeyNotification object:self.object];
    }
    return self;
}

@end










@implementation UIWindow (UIE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return UIWindowOperation.class;
}

@end










@interface UIEWindow ()

@end



@implementation UIEWindow

@end










@interface UIKeyboardOperationInfo ()

@property NSDictionary *dictionary;
@property CGRect frameBegin;
@property CGRect frameEnd;
@property NSTimeInterval animationDuration;
@property UIViewAnimationCurve animationCurve;
@property BOOL isLocal;

@end



@implementation UIKeyboardOperationInfo

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










@interface UIKeyboardOperation ()

@property UIKeyboardOperationInfo *info;

@end



@implementation UIKeyboardOperation

@dynamic delegates;

+ (instancetype)shared {
    static UIKeyboardOperation *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = self.new;
    });
    return shared;
}

- (instancetype)init {
    self = super.init;
    if (self) {
        [self.center addObserver:self.delegates selector:@selector(uiKeyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
        [self.center addObserver:self.delegates selector:@selector(uiKeyboardDidShowNotification:) name:UIKeyboardDidShowNotification object:nil];
        [self.center addObserver:self.delegates selector:@selector(uiKeyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
        [self.center addObserver:self.delegates selector:@selector(uiKeyboardDidHideNotification:) name:UIKeyboardDidHideNotification object:nil];
        [self.center addObserver:self.delegates selector:@selector(uiKeyboardWillChangeFrameNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
        [self.center addObserver:self.delegates selector:@selector(uiKeyboardDidChangeFrameNotification:) name:UIKeyboardDidChangeFrameNotification object:nil];
    }
    return self;
}

@end
