//
//  PayTool.m
//  Category
//
//  Created by 王乐乐 on 16/7/7.
//  Copyright © 2016年 Wanglele. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIBarButtonItem+WLBarButtonItem.h"
#import "UIViewController+WLViewController.h"

@protocol BaseViewControllerDelegate;
@interface BaseViewController : UIViewController

@property (nonatomic) id baseCacheData;
@property (weak, nonatomic) id baseCacheDataWeak;
@property (weak, nonatomic) id<BaseViewControllerDelegate> baseDelegate;

-(IBAction)actionOperations:(UIButton*)sender;


@end


@protocol BaseViewControllerDelegate <NSObject>

@optional
-(void)baseViewControllerDelegateCall:(id)sender data:(id)theData;

@end
