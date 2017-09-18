//
//  PayTool.m
//  Category
//
//  Created by 王乐乐 on 16/7/7.
//  Copyright © 2016年 Wanglele. All rights reserved.
//

#import "BaseButton.h"

@implementation BaseButton

- (void)awakeFromNib{
    [super awakeFromNib];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.top_sd = self.height_sd * 0.15;
    self.imageView.height_sd = self.imageView.height_sd;
    self.imageView.width_sd = self.imageView.width_sd;
    self.imageView.centerX_sd = self.width_sd * 0.5;
    
    self.titleLabel.left_sd = 0;
    self.titleLabel.top_sd = self.imageView.bottom_sd - 2;
    self.titleLabel.width_sd = self.width_sd;
    self.titleLabel.height_sd = self.height_sd - self.titleLabel.top_sd;
}
@end
