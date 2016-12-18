//
//  DraggableControl.m
//  Control
//
//  Created by Dan Kalinin on 12/16/16.
//  Copyright © 2016 Dan Kalinin. All rights reserved.
//

#import "DraggableButton.h"



@interface DraggableButton ()

@end



@implementation DraggableButton {
    CGRect baseFrame;
    CGRect targetFrame;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UIPanGestureRecognizer *pgr = [UIPanGestureRecognizer.alloc initWithTarget:self action:@selector(onPan:)];
    [self addGestureRecognizer:pgr];
}

- (BOOL)intersectsButton:(DraggableButton *)button {
    BOOL intersects = CGRectIntersectsRect(self.frame, button.frame);
    return intersects;
}

- (NSArray *)intersectedControls {
    NSMutableArray *buttons = [NSMutableArray array];
    for (DraggableButton *button in self.superview.subviews) {
        if ([button isEqual:self]) continue;
        if ([self intersectsButton:button]) {
            [buttons addObject:button];
        }
    }
    return buttons;
}

#pragma mark - Actions

- (void)onPan:(UIPanGestureRecognizer *)pgr {
    if (pgr.state == UIGestureRecognizerStateBegan) {
        
        [self sendActionsForControlEvents:UIControlEventTouchDragEnter];
        
        [self setFrames];
        
        CGPoint center = [self.window convertPoint:self.center fromView:self.superview];
        [self.window addSubview:self];
        self.center = center;
        
        [pgr setTranslation:self.center inView:self.window];
        
    } else if (pgr.state == UIGestureRecognizerStateChanged) {
        
        CGPoint center = [pgr translationInView:self.window];
        CGRect frame = [self clampingFrame];
        center = CGPointClampToRect(center, frame);
        self.center = center;
        
    } else if (pgr.state >= UIGestureRecognizerStateEnded) {
        
        CGPoint center = [self.targetView convertPoint:self.center fromView:self.window];
        [self.targetView addSubview:self];
        self.center = center;
        
        [self sendActionsForControlEvents:UIControlEventTouchDragExit];
        
    }
}

#pragma mark - Control

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [self.superview bringSubviewToFront:self];
    return YES;
}

#pragma mark - Helpers

- (void)setFrames {
    baseFrame = [self.window convertRect:self.baseView.frame fromView:self.baseView.superview];
    targetFrame = [self.window convertRect:self.targetView.frame fromView:self.targetView.superview];
}

- (CGRect)clampingFrame {
    
    CGRect frame = targetFrame;
    UIEdgeInsets insets = self.insets;
    
    if (self.edge == UIRectEdgeTop) {
        frame.origin.y = baseFrame.origin.y;
        frame.size.height = CGRectGetMaxY(targetFrame) - CGRectGetMinY(baseFrame);
        insets.top = self.inset;
    } else if (self.edge == UIRectEdgeBottom) {
        frame.size.height = CGRectGetMaxY(baseFrame) - CGRectGetMinY(targetFrame);
        insets.bottom = self.inset;
    } else if (self.edge == UIRectEdgeLeft) {
        frame.origin.x = baseFrame.origin.x;
        frame.size.width = CGRectGetMaxX(targetFrame) - CGRectGetMinX(baseFrame);
        insets.left = self.inset;
    } else if (self.edge == UIRectEdgeRight) {
        frame.size.width = CGRectGetMaxX(baseFrame) - CGRectGetMinX(targetFrame);
        insets.right = self.inset;
    }
    
    frame = UIEdgeInsetsInsetRect(frame, insets);
    return frame;
}

@end
