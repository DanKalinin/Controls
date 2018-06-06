//
//  CTLApplication.m
//  Controls
//
//  Created by Dan Kalinin on 6/6/18.
//

#import "CTLApplication.h"



@interface CTLApplication ()

@end



@implementation CTLApplication

+ (instancetype)shared {
    return (CTLApplication *)self.sharedApplication;
}

@end
