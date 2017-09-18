//
//  PayTool.m
//  Category
//
//  Created by 王乐乐 on 16/7/7.
//  Copyright © 2016年 Wanglele. All rights reserved.
//

#import "BaseNavigationViewController.h"
#import "UIBarButtonItem+WLBarButtonItem.h"

@interface BaseNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationViewController

- (void)awakeFromNib{
   [super awakeFromNib];

    [self.navigationBar setShadowImage:[UIImage new]];
}
/*
//找到UINavigationBar下面的线
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}
*/
- (void)viewDidLoad {
    [super viewDidLoad];    
    self.interactivePopGestureRecognizer.delegate = self;
}

#pragma mark - <UIGestureRecognizerDelegate>
/**
 *  手势识别器对象会调用这个代理方法来决定手势是否有效
 *
 *  @return YES : 手势有效, NO : 手势无效
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
        if (self.childViewControllers.count == 1) { // 导航控制器中只有1个子控制器
            return NO;
        }
        return YES;
    
    // 手势何时有效 : 当导航控制器的子控制器个数 > 1就有效
//    return NO;
//    return self.childViewControllers.count > 1;
}


/**
 *  重写push方法的目的 : 拦截所有push进来的子控制器
 *
 *  @param viewController 刚刚push进来的子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {         viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem wl_itemWithImage:@"nav_back" highImage:@"nav_back" callBack:^(UIButton *btn) {
            [viewController popTheVC];
        }];
    }
    // 所有设置搞定后, 再push控制器
    [super pushViewController:viewController animated:animated];
}


@end
