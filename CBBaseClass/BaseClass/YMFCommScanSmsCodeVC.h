//
//  YMFCommScanSmsCodeVC.h
//  Yunmafu
//
//  Created by 王乐乐 on 2017/6/2.
//  Copyright © 2017年 wanglele. All rights reserved.
//

@protocol YMFCommScanSmsCodeVCDelegate <NSObject>

- (void)yMFCommScanSmsCodeVCDelegate:(NSString *)str;

@end

#import "CBQRCodeScaningVC.h"
#import <AVFoundation/AVFoundation.h>

@interface YMFCommScanSmsCodeVC : CBQRCodeScaningVC

@property(nonatomic, weak) id <YMFCommScanSmsCodeVCDelegate> delegate;

@end
