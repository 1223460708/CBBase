//
//  BaseCollectionCell.m
//  Kangyx
//
//  Created by 王乐乐 on 16/9/13.
//  Copyright © 2016年 Wanglele. All rights reserved.
//

#import "BaseCollectionCell.h"

@implementation BaseCollectionCell

#pragma mark  外部接口
- (void)wl_ShowWithModel:(nullable id)modelTemp IndexPath:(nonnull NSIndexPath *)indexPath TableView:(nonnull UICollectionView *)tableView{
    
}

//获取高度
+ (CGSize)wl_HeightWithModel:(nullable id)modelTemp IndexPath:(nonnull NSIndexPath *)indexPath TableView:(nonnull UICollectionView *)tableView{
    return (CGSize){0,0};
}
#pragma mark  ------------

@end
