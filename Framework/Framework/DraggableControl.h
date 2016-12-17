//
//  DraggableControl.h
//  Control
//
//  Created by Dan Kalinin on 12/16/16.
//  Copyright © 2016 Dan Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface DraggableControl : UIControl

@property (weak, nonatomic) IBOutlet UIView *baseView;
@property (weak, nonatomic) IBOutlet UIView *sourceView;
@property (weak, nonatomic) IBOutlet UIView *targetView;

@property (nonatomic) IBInspectable UIRectEdge edge;
@property (nonatomic) IBInspectable CGFloat inset;
@property (nonatomic) IBInspectable UIEdgeInsets insets;

@property (readonly) NSArray *intersectedControls;
- (BOOL)intersectsControl:(DraggableControl *)control;

@end
