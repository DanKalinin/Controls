//
//  CTLResponder.m
//  Controls
//
//  Created by Dan Kalinin on 6/9/18.
//

#import "CTLResponder.h"



@implementation UIResponder (CTL)

- (CTLTableViewCell *)weakCell1 {
    return self.weakDictionary[NSStringFromSelector(@selector(weakCell1))];
}

- (void)setWeakCell1:(CTLTableViewCell *)weakCell1 {
    self.weakDictionary[NSStringFromSelector(@selector(weakCell1))] = weakCell1;
}

- (CTLTableViewCell *)weakCell2 {
    return self.weakDictionary[NSStringFromSelector(@selector(weakCell2))];
}

- (void)setWeakCell2:(CTLTableViewCell *)weakCell2 {
    self.weakDictionary[NSStringFromSelector(@selector(weakCell2))] = weakCell2;
}

- (CTLTableViewCell *)weakCell3 {
    return self.weakDictionary[NSStringFromSelector(@selector(weakCell3))];
}

- (void)setWeakCell3:(CTLTableViewCell *)weakCell3 {
    self.weakDictionary[NSStringFromSelector(@selector(weakCell3))] = weakCell3;
}

@end
