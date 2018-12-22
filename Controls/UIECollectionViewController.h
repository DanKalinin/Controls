//
//  UIECollectionViewController.h
//  Controls
//
//  Created by Dan Kalinin on 12/20/18.
//

#import <UIKit/UIKit.h>
#import "UIViewController.h"
#import "UIECollectionView.h"

@class UIECollectionViewController;
@class UIECollectionViewControllerOperation;










@interface UIECollectionViewController : UICollectionViewController <UIECollectionViewOperationDelegate>

//@property (nonatomic) UIECollectionView *collectionView;
//
//@property (readonly) Class operationClass;
//@property (readonly) UIECollectionViewControllerOperation *operation;

@end










@protocol UIECollectionViewControllerOperationDelegate <UIViewControllerOperationDelegate>

@end



@interface UIECollectionViewControllerOperation : UIViewControllerOperation <UIECollectionViewControllerOperationDelegate>

//@property (weak, readonly) UIECollectionViewController *viewController;

@end
