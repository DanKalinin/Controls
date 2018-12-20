//
//  UIETableViewCell.m
//  Controls
//
//  Created by Dan Kalinin on 12/20/18.
//

#import "UIETableViewCell.h"










@interface UIETableViewCell ()

@property BOOL enabled;

@end



@implementation UIETableViewCell

- (void)setEnabled:(BOOL)enabled animated:(BOOL)animated {
    self.enabled = enabled;
    
    self.userInteractionEnabled = enabled;
    
    self.weakButton1.enabled = enabled;
    self.weakButton2.enabled = enabled;
}

@end
