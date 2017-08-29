//
//  CollectionView.h
//  Framework
//
//  Created by Dan Kalinin on 10.03.17.
//  Copyright © 2017 Dan Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class CollectionView;

typedef NS_ENUM(NSUInteger, CollectionViewItemReorderingPolicy) {
    CollectionViewItemReorderingPolicyNone,
    CollectionViewItemReorderingPolicyInSection
};










@protocol CollectionViewDataSource <UICollectionViewDataSource>

@optional

@end










@protocol CollectionViewDelegate <UICollectionViewDelegate>

@optional
- (void)collectionView:(CollectionView *)collectionView didLongPressItemAtIndexPath:(NSIndexPath *)indexPath;

@end










@interface CollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet ImageView *imageView1;

@property (weak, nonatomic) IBOutlet UIView *view1;

@property (weak, nonatomic) IBOutlet ShapeLayerView *shapeLayerView1;

@property (weak, nonatomic) IBOutlet UIStackView *stackView1;

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@property (weak, nonatomic) IBOutlet UILabel *label6;
@property (weak, nonatomic) IBOutlet UILabel *label7;
@property (weak, nonatomic) IBOutlet UILabel *label8;
@property (weak, nonatomic) IBOutlet UILabel *label9;

@property (weak, nonatomic) IBOutlet Button *button1;

@property (weak, nonatomic) IBOutlet UITextField *textField1;

@property (weak, nonatomic) IBOutlet UIControl *control1;

@end










@interface CollectionReusableView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UILabel *label1;

@end










@interface CollectionView : UICollectionView

@property (strong, nonatomic) IBOutlet UIView *backgroundView;
@property (strong, nonatomic) IBOutlet UIView *emptyView;

@property (readonly) UILongPressGestureRecognizer *lpgr;

@property IBInspectable BOOL canMoveItems;
@property IBInspectable BOOL canMoveSingleItem;
@property IBInspectable CollectionViewItemReorderingPolicy itemReorderingPolicy;

@end










@interface CollectionViewController : UICollectionViewController <CollectionViewDataSource, CollectionViewDelegate>

@property (nonatomic) CollectionView *view;
@property (nonatomic) CollectionView *collectionView;

@end










@interface UICollectionView (Controls)

@property UICollectionViewFlowLayout *flowLayout;

@end










@interface UICollectionViewController (Controls) <UICollectionViewDelegateFlowLayout>

@end
