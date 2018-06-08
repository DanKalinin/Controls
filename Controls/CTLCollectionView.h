//
//  CTLCollectionView.h
//  Controls
//
//  Created by Dan Kalinin on 6/5/18.
//

#import <UIKit/UIKit.h>

@class CTLCollectionView, CTLCollectionViewController;










@interface CTLCollectionView : UICollectionView

@end










@interface CTLCollectionViewController : UICollectionViewController

@property (nonatomic) CTLCollectionView *collectionView;

@end
