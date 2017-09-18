//
//  CBBaseCustomLable.m
//  Yunmafu
//
//  Created by 炳神 on 2017/3/27.
//  Copyright © 2017年 wanglele. All rights reserved.
//

#import "CBBaseCustomLable.h"

@implementation CBBaseCustomLable
- (instancetype)init {
    if (self = [super init]) {
        _textInsets = UIEdgeInsetsZero;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _textInsets = UIEdgeInsetsZero;
    }
    return self;
}
// 修改绘制文字的区域，edgeInsets增加bounds
-(CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    
    /*
     调用父类该方法
     注意传入的UIEdgeInsetsInsetRect(bounds, self.edgeInsets),bounds是真正的绘图区域
     */
    CGRect rect = [super textRectForBounds:UIEdgeInsetsInsetRect(bounds,
                                                                 _textInsets) limitedToNumberOfLines:numberOfLines];
    //根据edgeInsets，修改绘制文字的bounds
    rect.origin.x -= _textInsets.left;
    rect.origin.y -= _textInsets.top;
    rect.size.width += _textInsets.left + _textInsets.right;
    rect.size.height += _textInsets.top + _textInsets.bottom;
    return rect;
}


- (void)drawTextInRect:(CGRect)rect {
//    UIEdgeInsets insets = {0, 5, 0, 5};
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, _textInsets)];
}

@end
