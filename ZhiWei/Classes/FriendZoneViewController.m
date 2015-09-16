//
//  FriendZoneViewController.m
//  ZhiWei
//
//  Created by SuperDaemon on 15/9/15.
//  Copyright (c) 2015年 meitu. All rights reserved.
//

#import "FriendZoneViewController.h"
#import "FriendZoneDatasource.h"

@interface FriendZoneViewController ()

@property (strong, nonatomic) IBOutlet FriendZoneDatasource *dataSource;

@end

@implementation FriendZoneViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView
{
    UINib *friendZoneCellNib = [UINib nibWithNibName:@"FriendZoneViewCell" bundle:nil];
    [self.collectionView registerNib:friendZoneCellNib forCellWithReuseIdentifier:@"FriendZoneCell"];
    _dataSource = [[FriendZoneDatasource alloc] init];
    self.collectionView.dataSource = _dataSource;
    __weak typeof(self) weakSelf = self;
    _dataSource.configureCellBlock = ^(FriendZoneViewCell *cell, NSIndexPath *indexPath, NSString *text) {
        cell.name.text = text;
        cell.bgView.backgroundColor = [weakSelf genrateColor];
        // 卡片动画
        cell.bgView.layer.transform = CATransform3DConcat(CATransform3DMakeScale(0.8f, 0.8f, 0.8f), CATransform3DIdentity);
//        cell.layer.transform = CATransform3DConcat(CATransform3DMakeRotation(M_PI/6.f, 1.f, .0f, .0f), CATransform3DIdentity);
        cell.bgView.layer.opacity = 0.0;
        [UIView animateWithDuration:.5f
                              delay:.0f
                            options:UIViewAnimationOptionAllowUserInteraction
                         animations:^{
                             cell.bgView.layer.transform = CATransform3DIdentity;
                             cell.bgView.layer.opacity = 1.0;
                         }
                         completion:nil];
    };
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIColor *)genrateColor
{
    NSInteger red = arc4random() % 256;
    NSInteger blue = arc4random() % 256;
    NSInteger green = arc4random() % 256;
    
    UIColor *color = [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
    return color;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
