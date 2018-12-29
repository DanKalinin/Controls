//
//  UITableViewCell.m
//  Controls
//
//  Created by Dan Kalinin on 12/28/18.
//

#import "UITableViewCell.h"










@interface UITableViewCellOperation ()

@property BOOL enabled;

@end



@implementation UITableViewCellOperation

@dynamic object;

- (void)setEnabled:(BOOL)enabled animated:(BOOL)animated {
    self.enabled = enabled;
    
    self.object.userInteractionEnabled = enabled;
    
    self.object.uieWeakButton1.enabled = enabled;
    self.object.uieWeakButton2.enabled = enabled;
}

@end










@implementation UITableViewCell (UIE)

@dynamic nseOperation;
@dynamic uieWeakButton1;
@dynamic uieWeakButton2;
@dynamic uieWeakTextField1;
@dynamic uieWeakActivityIndicatorView1;

- (Class)nseOperationClass {
    return UITableViewCellOperation.class;
}

@end
