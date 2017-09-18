//
//  BaseCollectionCell.h
//  Kangyx
//
//  Created by 王乐乐 on 16/9/13.
//  Copyright © 2016年 Wanglele. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BaseCollectionCellProtocol <NSObject>

//显示内容到cell上
- (void)wl_ShowWithModel:(nullable id)modelTemp IndexPath:(nonnull NSIndexPath *)indexPath TableView:(nonnull UICollectionView *)tableView;

//获取高度
+ (CGSize)wl_HeightWithModel:(nullable id)modelTemp IndexPath:(nonnull NSIndexPath *)indexPath TableView:(nonnull UICollectionView *)tableView;



@end
@interface BaseCollectionCell : UICollectionViewCell<BaseCollectionCellProtocol>

@end
