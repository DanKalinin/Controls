//
//  CollectionView.m
//  Framework
//
//  Created by Dan Kalinin on 10.03.17.
//  Copyright © 2017 Dan Kalinin. All rights reserved.
//

#import "CollectionView.h"










@interface CollectionViewCell ()

@end



@implementation CollectionViewCell

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    self.button1.selected = selected;
}

@end










@interface CollectionReusableView ()

@end



@implementation CollectionReusableView

@end










@interface CollectionView () <CollectionViewDataSource, CollectionViewDelegate>

@property SurrogateArray<CollectionViewDataSource> *originalDataSource;
@property SurrogateArray<CollectionViewDelegate> *originalDelegate;

@property SurrogateArray<CollectionViewDataSource> *dataSources;
@property SurrogateArray<CollectionViewDelegate> *delegates;

@property NSTimer *longPressTimer;

@end



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"

@implementation CollectionView

@dynamic backgroundView;

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        super.dataSource = self;
        super.delegate = self;
        
        self.longPressDuration = 0.5;
    }
    return self;
}

#pragma mark - Accessors

- (void)setDataSource:(id<CollectionViewDataSource>)dataSource {
    if (dataSource) {
        self.originalDataSource = (id)SurrogateArray.new;
        [self.originalDataSource addObject:dataSource];
        
        self.dataSources = (id)SurrogateArray.new;
        [self.dataSources addObject:dataSource];
        [self.dataSources addObject:self];
        [super setDataSource:self.dataSources];
    } else {
        [super setDataSource:self];
    }
}

- (void)setDelegate:(id<CollectionViewDelegate>)delegate {
    if (delegate) {
        self.originalDelegate = (id)SurrogateArray.new;
        [self.originalDelegate addObject:delegate];
        
        self.delegates = (id)SurrogateArray.new;
        [self.delegates addObject:delegate];
        [self.delegates addObject:self];
        [super setDelegate:self.delegates];
    } else {
        // TODO: Workaround
        // [super setDelegate:self];
    }
}

#pragma mark - Collection view

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    NSInteger sections = [self.dataSources.lastReturnValue integerValue];
    if (self.emptyView) {
        BOOL show = (sections == 0);
        if (sections == 1) {
            NSInteger rows = [self.dataSources collectionView:self numberOfItemsInSection:0];
            show = (rows == 0);
        }
        self.backgroundView = show ? self.emptyView : nil;
    }
    return sections;
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    self.longPressTimer = [NSTimer scheduledTimerWithTimeInterval:self.longPressDuration repeats:NO block:^(NSTimer *timer) {
        [self.originalDelegate collectionView:self didLongPressItemAtIndexPath:indexPath];
    }];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.longPressTimer invalidate];
}

@end

#pragma clang diagnostic pop










@implementation UICollectionView (Controls)

- (void)setFlowLayout:(UICollectionViewFlowLayout *)flowLayout {
    self.collectionViewLayout = flowLayout;
}

- (UICollectionViewFlowLayout *)flowLayout {
    return (UICollectionViewFlowLayout *)self.collectionViewLayout;
}

@end










@implementation UICollectionViewController (Controls)

@end
