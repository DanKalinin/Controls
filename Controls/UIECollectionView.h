//
//  UIECollectionView.h
//  Controls
//
//  Created by Dan Kalinin on 12/9/18.
//

#import <UIKit/UIKit.h>
#import "UIViewController.h"

@class UIECollectionView;
@class UIECollectionViewOperation;
@class UIECollectionViewController;
@class UIECollectionViewControllerOperation;










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










@interface UIECollectionViewController : UICollectionViewController <UIECollectionViewOperationDelegate>

@property (nonatomic) UIECollectionView *collectionView;

@property (readonly) Class operationClass;
@property (readonly) UIECollectionViewControllerOperation *operation;

@end










@protocol UIECollectionViewControllerOperationDelegate <UIViewControllerOperationDelegate>

@end



@interface UIECollectionViewControllerOperation : UIViewControllerOperation <UIECollectionViewControllerOperationDelegate>

@property (weak, readonly) UIECollectionViewController *viewController;

@end
