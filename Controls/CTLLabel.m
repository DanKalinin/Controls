//
//  CTLLabel.m
//  Controls
//
//  Created by Dan Kalinin on 8/14/18.
//

#import "CTLLabel.h"



@interface CTLLabel ()

@end



@implementation CTLLabel

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    
    if (enabled) {
        self.backgroundColor = self.defaultBackgroundColor;
        self.layerBorderColor = self.defaultLayerBorderColor;
    } else {
        self.backgroundColor = self.disabledBackgroundColor;
        self.layerBorderColor = self.disabledLayerBorderColor;
    }
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        self.backgroundColor = self.highlightedBackgroundColor;
        self.layerBorderColor = self.highlightedLayerBorderColor;
    } else {
        self.backgroundColor = self.defaultBackgroundColor;
        self.layerBorderColor = self.defaultLayerBorderColor;
    }
}

@end
