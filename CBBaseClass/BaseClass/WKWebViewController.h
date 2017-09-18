//
//  WKWebViewController.h
//  Yunmafu
//
//  Created by 炳神 on 2017/2/16.
//  Copyright © 2017年 wanglele. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+WLViewController.h"

@interface WKWebViewController : UIViewController

@property (nonatomic,copy)NSString *wkWebUrlStr;
@property (nonatomic,copy)NSString *wkWebTitle;

/**
 改变导航条颜色 默认NaviColor
 */
@property (nonatomic, strong) UIColor * navColor;

/**
 是否不可滑动 默认No
 */
@property (nonatomic, assign) BOOL noScroll;


/**
 * 传递过来 用户截屏的时候给后台传递关闭订单
 */
@property (nonatomic, copy) NSString * orderNo;


@end
