//
//  UIETableViewCell.h
//  Controls
//
//  Created by Dan Kalinin on 12/20/18.
//

#import <UIKit/UIKit.h>

#import "UIEButton.h"
#import "UIETextField.h"

@class UIETableViewCell;



@interface UIETableViewCell : UITableViewCell

@property (weak) IBOutlet UIEButton *weakButton1;
@property (weak) IBOutlet UIEButton *weakButton2;

@property (weak) IBOutlet UIETextField *weakTextField1;

@property (weak) IBOutlet UIActivityIndicatorView *weakActivityIndicatorView1;

@property (readonly) BOOL enabled;

- (void)setEnabled:(BOOL)enabled animated:(BOOL)animated;

@end
