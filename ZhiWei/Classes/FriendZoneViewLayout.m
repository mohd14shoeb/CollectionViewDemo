//
//  FriendZoneViewLayout.m
//  ZhiWei
//
//  Created by SuperDaemon on 15/9/15.
//  Copyright (c) 2015年 meitu. All rights reserved.
//

#import "FriendZoneViewLayout.h"
#import "FriendZoneDatasource.h"

static const CGFloat cellHeight = 250;

@implementation FriendZoneViewLayout

- (void)prepareLayout
{
    
}

- (CGSize)collectionViewContentSize
{
    CGFloat width = self.collectionView.bounds.size.width;
    CGFloat height = cellHeight * 20;
    CGSize size = CGSizeMake(width, height);
    return size;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *layoutAttributes = [NSMutableArray array];
    NSArray *visibleIndexPaths = [self indexPathsOfItemsInRect:rect];
    for (NSIndexPath *indexPath in visibleIndexPaths) {
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [layoutAttributes addObject:attributes];
    }
    
    return layoutAttributes;
}

- (NSArray *)indexPathsOfItemsInRect:(CGRect)rect
{
    FriendZoneDatasource *dataSource = self.collectionView.dataSource;
    NSArray *indexPaths = [dataSource indexPathsOfDataWithRect:rect contentHeight:[self collectionViewContentSize].height];
    return indexPaths;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.frame = CGRectMake(0, indexPath.item * cellHeight , self.collectionView.bounds.size.width, cellHeight);
    return attributes;
}

@end
