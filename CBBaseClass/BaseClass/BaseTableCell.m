//
//  BaseTableCell.m
//  Kangyx
//
//  Created by 王乐乐 on 16/9/13.
//  Copyright © 2016年 Wanglele. All rights reserved.
//

#import "BaseTableCell.h"

@implementation BaseTableCell

#pragma mark  外部接口
- (void)wl_ShowWithModel:(nullable id)model IndexPath:(nonnull NSIndexPath *)indexPath TableView:(nonnull UITableView *)tableView{
    
}

+ (CGFloat)wl_HeightWithModel:(nullable id)model IndexPath:(nonnull NSIndexPath *)indexPath TableView:(nonnull UITableView *)tableView{
    return 0;
}
#pragma mark  --------

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (nullable UIViewController *)wl_getThisViewController{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}


@end
