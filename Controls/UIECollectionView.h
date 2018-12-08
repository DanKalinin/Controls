//
//  UIECollectionView.h
//  Controls
//
//  Created by Dan Kalinin on 12/9/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class UIECollectionView;
@class UIECollectionViewOperation;










@interface UIECollectionView : UICollectionView

@property (readonly) Class operationClass;
@property (readonly) UIECollectionViewOperation *operation;

@end










@protocol UIECollectionViewOperationDelegate <NSEOperationDelegate, UICollectionViewDelegate, UICollectionViewDataSource>

@end



@interface UIECollectionViewOperation : NSEOperation <UIECollectionViewOperationDelegate>

@property (readonly) HLPArray<UIECollectionViewOperationDelegate> *delegates;

@property (weak, readonly) UIECollectionView *collectionView;

- (instancetype)initWithCollectionView:(UIECollectionView *)collectionView;

@end
