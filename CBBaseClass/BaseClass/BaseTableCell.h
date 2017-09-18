//
//  BaseTableCell.h
//  Kangyx
//
//  Created by 王乐乐 on 16/9/13.
//  Copyright © 2016年 Wanglele. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BaseTableCellProtocol <NSObject>

/** 显示内容到cell上 */
- (void)wl_ShowWithModel:(nullable id)modelTemp IndexPath:(nonnull NSIndexPath *)indexPath TableView:(nonnull UITableView *)tableView;

/** 获取高度 */
+ (CGFloat)wl_HeightWithModel:(nullable id)modelTemp IndexPath:(nonnull NSIndexPath *)indexPath TableView:(nonnull UITableView *)tableView;

@end

@interface BaseTableCell : UITableViewCell<BaseTableCellProtocol>

- (nullable UIViewController * )wl_getThisViewController;

@end
