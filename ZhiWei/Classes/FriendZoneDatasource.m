//
//  FriendZoneDatasource.m
//  ZhiWei
//
//  Created by SuperDaemon on 15/9/15.
//  Copyright (c) 2015年 meitu. All rights reserved.
//

#import "FriendZoneDatasource.h"

static NSString* kFriendZoneCell = @"FriendZoneCell";
const static CGFloat cellHeight = 250;

@interface FriendZoneDatasource ()

@property (strong, nonatomic) NSMutableArray *data;

@end

@implementation FriendZoneDatasource

- (instancetype)init
{
    if (self = [super init]) {
        _data = [NSMutableArray array];
        [self generateSampleData];
    }
    
    return self;
}

- (void)generateSampleData
{
    for (NSInteger i = 0; i < 20; i++) {
        NSString *text = [NSString stringWithFormat:@"%ld", (long)i];
        [self.data addObject:text];
    }
}

- (NSArray *)indexPathsOfDataWithRect:(CGRect)rect contentHeight:(CGFloat)height
{
    NSMutableArray *indexPaths = [NSMutableArray array];
    [self.data enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        if (cellHeight * idx >= rect.origin.y - rect.size.height && cellHeight * idx <= rect.size.height + rect.origin.y) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:idx inSection:0];
            [indexPaths addObject:indexPath];
        }
    }];
    
    return indexPaths;
}

#pragma maek - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.data count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text = self.data[indexPath.item];
    FriendZoneViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kFriendZoneCell forIndexPath:indexPath];
    if (self.configureCellBlock) {
        self.configureCellBlock(cell, indexPath, text);
    }
    
    return cell;
}

@end
