//
//  UIEWindow.m
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import "UIEWindow.h"










@interface UIEWindowOperation ()

@end



@implementation UIEWindowOperation

@dynamic delegates;
@dynamic object;

- (instancetype)initWithObject:(UIWindow *)object {
    self = [super initWithObject:object];
    if (self) {
        [self.center addObserver:self.delegates selector:@selector(uieWindowDidBecomeVisibleNotification:) name:UIWindowDidBecomeVisibleNotification object:object];
        [self.center addObserver:self.delegates selector:@selector(uieWindowDidBecomeHiddenNotification:) name:UIWindowDidBecomeHiddenNotification object:object];
        [self.center addObserver:self.delegates selector:@selector(uieWindowDidBecomeKeyNotification:) name:UIWindowDidBecomeKeyNotification object:object];
        [self.center addObserver:self.delegates selector:@selector(uieWindowDidResignKeyNotification:) name:UIWindowDidResignKeyNotification object:object];
    }
    return self;
}

@end










@implementation UIWindow (UIE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return UIEWindowOperation.class;
}

@end










@interface UIEWindow ()

@end



@implementation UIEWindow

@end










@interface UIEKeyboardOperationInfo ()

@property NSDictionary *dictionary;
@property CGRect frameBegin;
@property CGRect frameEnd;
@property NSTimeInterval animationDuration;
@property UIViewAnimationCurve animationCurve;
@property BOOL isLocal;

@end



@implementation UIEKeyboardOperationInfo

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










@interface UIEKeyboardOperation ()

@property UIEKeyboardOperationInfo *info;

@end



@implementation UIEKeyboardOperation

@dynamic delegates;

+ (instancetype)shared {
    static UIEKeyboardOperation *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = self.new;
    });
    return shared;
}

- (instancetype)init {
    self = super.init;
    if (self) {
        [self.center addObserver:self.delegates selector:@selector(uieKeyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
        [self.center addObserver:self.delegates selector:@selector(uieKeyboardDidShowNotification:) name:UIKeyboardDidShowNotification object:nil];
        [self.center addObserver:self.delegates selector:@selector(uieKeyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
        [self.center addObserver:self.delegates selector:@selector(uieKeyboardDidHideNotification:) name:UIKeyboardDidHideNotification object:nil];
        [self.center addObserver:self.delegates selector:@selector(uieKeyboardWillChangeFrameNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
        [self.center addObserver:self.delegates selector:@selector(uieKeyboardDidChangeFrameNotification:) name:UIKeyboardDidChangeFrameNotification object:nil];
    }
    return self;
}

@end
