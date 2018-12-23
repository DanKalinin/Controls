//
//  CTLApplication.m
//  Controls
//
//  Created by Dan Kalinin on 6/6/18.
//

#import "CTLApplication.h"



@interface CTLApplication ()

@property HLPArray<CTLApplicationDelegate> *delegates;
@property UIKeyboardOperation *keyboard;

@end



@implementation CTLApplication

+ (instancetype)shared {
    return (CTLApplication *)self.sharedApplication;
}

- (instancetype)init {
    self = super.init;
    if (self) {
        self.delegates = (id)HLPArray.weakArray;
        self.delegates.operationQueue = NSOperationQueue.mainQueue;
        [self.delegates addObject:self];
        
        self.delegate = self.delegates;
        
        self.keyboard = UIKeyboardOperation.shared;
        [self.keyboard.delegates addObject:self.delegates];
        [self.keyboard start];
    }
    return self;
}

- (void)addOperation:(HLPOperation *)operation {
    [self.operationQueue addOperation:operation];
    
    [operation.delegates addObject:self.delegates];
}

@end
