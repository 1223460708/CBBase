//
//  UILabel+CBBaseCustomLable.h
//  Yunmafu
//
//  Created by 炳神 on 2017/3/27.
//  Copyright © 2017年 wanglele. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CBBaseCustomLable)
//@property (nonatomic, assign) UIEdgeInsets textInsets; // 控制字体与控件边界的间隙
@property (nonatomic,strong)NSArray *fl;
- (void)textInsets:(UIEdgeInsets)textinset;
@end
