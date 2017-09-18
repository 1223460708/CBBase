//
//  YMFCommScanSmsCodeVC.m
//  Yunmafu
//
//  Created by 王乐乐 on 2017/6/2.
//  Copyright © 2017年 wanglele. All rights reserved.
//

#import "YMFCommScanSmsCodeVC.h"

@interface YMFCommScanSmsCodeVC ()

@end

@implementation YMFCommScanSmsCodeVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // 注册观察者
    //    [CBQRCodeNotificationCenter addObserver:self selector:@selector(SGQRCodeInformationFromeAibum:) name:CBQRCodeInformationFromeAibum object:nil];
    [CBQRCodeNotificationCenter addObserver:self selector:@selector(CBQRCodeInformationFromeScanning:) name:CBQRCodeInformationFromeScanning object:nil];
}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = BackGroudColor;
    [self wl_navTitle:@"扫描" titleColor:[UIColor whiteColor]];
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:Font(16),NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    self.navigationController.navigationBar.translucent = false;
    [self.navigationController.navigationBar setBackgroundImage:ImageNamed(@"nav_bg_normal") forBarMetrics:UIBarMetricsDefault];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.translucent = true;
    [CBQRCodeNotificationCenter removeObserver:self];
}


- (void)CBQRCodeInformationFromeScanning:(NSNotification *)noti {
    if ([self.delegate respondsToSelector:@selector(yMFCommScanSmsCodeVCDelegate:)]) {
        [self.delegate yMFCommScanSmsCodeVCDelegate:noti.object];
    }
    [self popTheVC];
}

- (void)dealloc {
    [CBQRCodeNotificationCenter removeObserver:self];
}


@end
