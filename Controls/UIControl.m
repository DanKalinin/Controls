//
//  UIControl.m
//  Controls
//
//  Created by Dan Kalinin on 12/23/18.
//

#import "UIControl.h"










@interface UIControlOperation ()

@end



@implementation UIControlOperation

@dynamic object;
@dynamic weakObject;

#pragma mark - Control operation

- (void)UIControlOperationDidSetEnabled:(UIControlOperation *)operation {
    if (self.weakObject.enabled) {
        self.weakObject.backgroundColor = self.weakObject.defaultBackgroundColor;
        self.weakObject.layerBorderColor = self.weakObject.defaultLayerBorderColor;
    } else {
        self.weakObject.backgroundColor = self.weakObject.disabledBackgroundColor;
        self.weakObject.layerBorderColor = self.weakObject.disabledLayerBorderColor;
    }
}

- (void)UIControlOperationDidSetSelected:(UIControlOperation *)operation {
    if (self.weakObject.selected) {
        self.weakObject.backgroundColor = self.weakObject.selectedBackgroundColor;
        self.weakObject.layerBorderColor = self.weakObject.selectedLayerBorderColor;
    } else {
        self.weakObject.backgroundColor = self.weakObject.defaultBackgroundColor;
        self.weakObject.layerBorderColor = self.weakObject.defaultLayerBorderColor;
    }
}

- (void)UIControlOperationDidSetHighlighted:(UIControlOperation *)operation {
    if (self.weakObject.highlighted) {
        self.weakObject.backgroundColor = self.weakObject.highlightedBackgroundColor;
        self.weakObject.layerBorderColor = self.weakObject.highlightedLayerBorderColor;
    } else {
        self.weakObject.backgroundColor = self.weakObject.defaultBackgroundColor;
        self.weakObject.layerBorderColor = self.weakObject.defaultLayerBorderColor;
    }
}

@end










@implementation UIControl (UIE)

@dynamic defaultBackgroundColor;
@dynamic highlightedBackgroundColor;
@dynamic selectedBackgroundColor;
@dynamic disabledBackgroundColor;

@dynamic defaultLayerBorderColor;
@dynamic highlightedLayerBorderColor;
@dynamic selectedLayerBorderColor;
@dynamic disabledLayerBorderColor;

@end
