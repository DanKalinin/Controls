//
//  UIECollectionView.m
//  Controls
//
//  Created by Dan Kalinin on 12/9/18.
//

#import "UIECollectionView.h"










@interface UIECollectionView ()

@property UIECollectionViewOperation *operation;

@end



@implementation UIECollectionView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (Class)operationClass {
    return UIECollectionViewOperation.class;
}

@end










@interface UIECollectionViewOperation ()

@property (weak) UIECollectionView *collectionView;

@end



@implementation UIECollectionViewOperation

@dynamic delegates;

- (instancetype)initWithCollectionView:(UIECollectionView *)collectionView {
    self = super.init;
    if (self) {
        self.collectionView = collectionView;
        self.collectionView.delegate = self.delegates;
        self.collectionView.dataSource = self.delegates;
    }
    return self;
}

@end
