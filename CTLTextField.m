//
//  CTLTextField.m
//  Controls
//
//  Created by Dan Kalinin on 9/1/18.
//

#import "CTLTextField.h"



@interface CTLTextField ()

@property HLPArray<CTLTextFieldDelegate> *delegates;

@end



@implementation CTLTextField

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.delegates = (id)HLPArray.weakArray;
        self.delegates.operationQueue = NSOperationQueue.mainQueue;
        [self.delegates addObject:self];
        
        self.delegate = self.delegates;
    }
    return self;
}

@end
