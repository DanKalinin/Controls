//
//  UIWindow.m
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import "UIWindow.h"










@interface UIWindowOperation ()

@end



@implementation UIWindowOperation

@dynamic delegates;
@dynamic object;

- (instancetype)initWithObject:(UIWindow *)object {
    self = [super initWithObject:object];
    if (self) {
        [self.center addObserver:self selector:@selector(UIWindowDidBecomeVisibleNotification:) name:UIWindowDidBecomeVisibleNotification object:self.object];
        [self.center addObserver:self selector:@selector(UIWindowDidBecomeHiddenNotification:) name:UIWindowDidBecomeHiddenNotification object:self.object];
        [self.center addObserver:self selector:@selector(UIWindowDidBecomeKeyNotification:) name:UIWindowDidBecomeKeyNotification object:self.object];
        [self.center addObserver:self selector:@selector(UIWindowDidResignKeyNotification:) name:UIWindowDidResignKeyNotification object:self.object];
    }
    return self;
}

#pragma mark - Notifications

- (void)UIWindowDidBecomeVisibleNotification:(NSNotification *)notification {
    [self.delegates UIWindowOperationDidBecomeVisible:self];
}

- (void)UIWindowDidBecomeHiddenNotification:(NSNotification *)notification {
    [self.delegates UIWindowOperationDidBecomeHidden:self];
}

- (void)UIWindowDidBecomeKeyNotification:(NSNotification *)notification {
    [self.delegates UIWindowOperationDidBecomeKey:self];
}

- (void)UIWindowDidResignKeyNotification:(NSNotification *)notification {
    [self.delegates UIWindowOperationDidResignKey:self];
}

@end










@implementation UIWindow (UIE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return UIWindowOperation.class;
}

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
        [self.center addObserver:self selector:@selector(uiKeyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
        [self.center addObserver:self selector:@selector(uiKeyboardDidShowNotification:) name:UIKeyboardDidShowNotification object:nil];
        [self.center addObserver:self selector:@selector(uiKeyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
        [self.center addObserver:self selector:@selector(uiKeyboardDidHideNotification:) name:UIKeyboardDidHideNotification object:nil];
        [self.center addObserver:self selector:@selector(uiKeyboardWillChangeFrameNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
        [self.center addObserver:self selector:@selector(uiKeyboardDidChangeFrameNotification:) name:UIKeyboardDidChangeFrameNotification object:nil];
    }
    return self;
}

#pragma mark - Notifications

- (void)uiKeyboardWillShowNotification:(NSNotification *)notification {
    self.info = [UIKeyboardOperationInfo.alloc initWithDictionary:notification.userInfo];
    [self.delegates uiKeyboardOperationWillShow:self];
}

- (void)uiKeyboardDidShowNotification:(NSNotification *)notification {
    self.info = [UIKeyboardOperationInfo.alloc initWithDictionary:notification.userInfo];
    [self.delegates uiKeyboardOperationDidShow:self];
}

- (void)uiKeyboardWillHideNotification:(NSNotification *)notification {
    self.info = [UIKeyboardOperationInfo.alloc initWithDictionary:notification.userInfo];
    [self.delegates uiKeyboardOperationWillHide:self];
}

- (void)uiKeyboardDidHideNotification:(NSNotification *)notification {
    self.info = [UIKeyboardOperationInfo.alloc initWithDictionary:notification.userInfo];
    [self.delegates uiKeyboardOperationDidHide:self];
}

- (void)uiKeyboardWillChangeFrameNotification:(NSNotification *)notification {
    self.info = [UIKeyboardOperationInfo.alloc initWithDictionary:notification.userInfo];
    [self.delegates uiKeyboardOperationWillChangeFrame:self];
}

- (void)uiKeyboardDidChangeFrameNotification:(NSNotification *)notification {
    self.info = [UIKeyboardOperationInfo.alloc initWithDictionary:notification.userInfo];
    [self.delegates uiKeyboardOperationDidChangeFrame:self];
}

@end
