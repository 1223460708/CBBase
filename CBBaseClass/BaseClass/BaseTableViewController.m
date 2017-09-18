//
//  PayTool.m
//  Category
//
//  Created by 王乐乐 on 16/7/7.
//  Copyright © 2016年 Wanglele. All rights reserved.
//

#import "BaseTableViewController.h"

@implementation BaseTableViewController

- (void)awakeFromNib{
    [super awakeFromNib];
//    self.netManager = [[SHNetService alloc] init];
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
       [self awakeFromNib];
    }
    return self;
}

-(void)viewDidLoad{
  [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.backgroundColor = BackGroudColor;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
}

-(IBAction)actionOperations:(id)sender{
  WLog(@"--- actionOperations method empty ---");
}

@end
