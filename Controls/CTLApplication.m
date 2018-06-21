//
//  CTLApplication.m
//  Controls
//
//  Created by Dan Kalinin on 6/6/18.
//

#import "CTLApplication.h"



@interface CTLApplication ()

@property HLPArray<CTLApplicationDelegate> *delegates;

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
    }
    return self;
}

- (void)addOperation:(HLPOperation *)operation {
    [self.operationQueue addOperation:operation];
    
    [operation.delegates addObject:self.delegates];
}

@end
