//
//  UIEButton.m
//  Controls
//
//  Created by Dan Kalinin on 11/29/18.
//

#import "UIEButton.h"



@interface UIEButton ()

@end



@implementation UIEButton

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    
    self.button1.enabled = enabled;
    
    if (enabled) {
        self.backgroundColor = self.defaultBackgroundColor;
        self.layerBorderColor = self.defaultLayerBorderColor;
    } else {
        self.backgroundColor = self.disabledBackgroundColor;
        self.layerBorderColor = self.disabledLayerBorderColor;
    }
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    self.button1.selected = selected;
    
    if (selected) {
        self.backgroundColor = self.selectedBackgroundColor;
        self.layerBorderColor = self.selectedLayerBorderColor;
    } else {
        self.backgroundColor = self.defaultBackgroundColor;
        self.layerBorderColor = self.defaultLayerBorderColor;
    }
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    self.button1.highlighted = highlighted;
    
    if (highlighted) {
        self.backgroundColor = self.highlightedBackgroundColor;
        self.layerBorderColor = self.highlightedLayerBorderColor;
    } else {
        self.backgroundColor = self.defaultBackgroundColor;
        self.layerBorderColor = self.defaultLayerBorderColor;
    }
}

@end
