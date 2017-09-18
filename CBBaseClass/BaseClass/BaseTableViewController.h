//
//  PayTool.m
//  Category
//
//  Created by 王乐乐 on 16/7/7.
//  Copyright © 2016年 Wanglele. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+WLViewController.h"
#import "UIBarButtonItem+WLBarButtonItem.h"
#import "BaseTableCell.h"

@protocol BaseTableViewControllerDelegate;
@interface BaseTableViewController : UITableViewController

@property (nonatomic) id baseCacheData;
@property (weak, nonatomic) id baseCacheDataWeak;
@property (weak, nonatomic) id<BaseTableViewControllerDelegate> baseDelegate;

-(IBAction)actionOperations:(id)sender;

@end

@protocol BaseTableViewControllerDelegate <NSObject>

@optional
-(void)baseViewControllerDelegateCall:(id)sender data:(id)theData;

@end
