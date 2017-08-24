//
//  CollectionView.h
//  Framework
//
//  Created by Dan Kalinin on 10.03.17.
//  Copyright © 2017 Dan Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>










@protocol CollectionViewDataSource <UICollectionViewDataSource>

@end










@protocol CollectionViewDelegate <UICollectionViewDelegate>

@end










@interface CollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet ImageView *imageView1;

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;

@property (weak, nonatomic) IBOutlet Button *button1;

@property (weak, nonatomic) IBOutlet UITextField *textField1;

@property (weak, nonatomic) IBOutlet UIControl *control1;

@end










@interface CollectionReusableView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UILabel *label1;

@end










@interface CollectionView : UICollectionView

@end










@interface UICollectionViewController (Controls) <CollectionViewDataSource, CollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end
