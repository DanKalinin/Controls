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










@interface UIECollectionViewController ()

@property UIECollectionViewControllerOperation *operation;

@end



@implementation UIECollectionViewController

@dynamic collectionView;

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.operation = [self.operationClass.alloc initWithViewController:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView.operation.delegates addObject:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.operation.prepareForSegueInfo = [UIViewControllerOperationPrepareForSegueInfo.alloc initWithSegue:segue sender:sender];
}

- (Class)operationClass {
    return UIECollectionViewControllerOperation.class;
}

@end










@interface UIECollectionViewControllerOperation ()

@end



@implementation UIECollectionViewControllerOperation

@dynamic viewController;

@end
