//
//  FriendZoneDatasource.h
//  ZhiWei
//
//  Created by SuperDaemon on 15/9/15.
//  Copyright (c) 2015年 meitu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FriendZoneViewCell.h"

typedef void (^ConfigureCellBlock)(FriendZoneViewCell *cell, NSIndexPath *indexPath, NSString *text);

@interface FriendZoneDatasource : NSObject <UICollectionViewDataSource>

@property (nonatomic , copy) ConfigureCellBlock configureCellBlock;

- (NSArray *)indexPathsOfDataWithRect:(CGRect)rect contentHeight:(CGFloat)height;

@end
