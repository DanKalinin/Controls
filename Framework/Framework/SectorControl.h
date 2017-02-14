//
//  SectorControl.h
//  SectorControl
//
//  Created by Dan Kalinin on 1/31/17.
//  Copyright © 2017 Dan Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>



@interface SectorControl : UIControl

@property (strong, nonatomic) IBOutletCollection(FilledButton) NSArray *sectors;

@property (weak, nonatomic) IBOutlet FilledButton *initialSector;

@property IBInspectable CGFloat sectorWidth;
@property IBInspectable CGFloat borderWidth;
@property IBInspectable CGFloat startAngle;
@property IBInspectable CGFloat disabledAlpha;
@property IBInspectable BOOL deselactable;

@property (readonly) FilledButton *sector;
- (void)selectSector:(FilledButton *)sector animated:(BOOL)animated;

@end
