//
//  UITableView.m
//  Controls
//
//  Created by Dan Kalinin on 12/24/18.
//

#import "UITableView.h"










@interface UITableViewOperation ()

@end



@implementation UITableViewOperation

@dynamic delegates;
@dynamic weakObject;

- (instancetype)initWithWeakObject:(UITableView *)weakObject {
    self = [super initWithWeakObject:weakObject];
    if (self) {
        self.weakObject.delegate = self.delegates;
        self.weakObject.dataSource = self.delegates;
    }
    return self;
}

@end










@implementation UITableView (UIE)

@end
