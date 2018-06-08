//
//  CTLResponder.h
//  Controls
//
//  Created by Dan Kalinin on 6/9/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>
#import "CTLTableView.h"



@interface UIResponder (CTL)

@property IBOutlet CTLTableViewCell *weakCell1;
@property IBOutlet CTLTableViewCell *weakCell2;
@property IBOutlet CTLTableViewCell *weakCell3;

@end
