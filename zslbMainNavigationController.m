//
//  zslbMainNavigationController.m
//  zslb
//
//  Created by zhangchao on 15/11/26.
//  Copyright © 2015年 leo. All rights reserved.
//

#import "zslbMainNavigationController.h"
#import "Header.h"
@interface zslbMainNavigationController ()

@end

@implementation zslbMainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //导航栏按钮文字颜色+返回按钮颜色
    [self.navigationBar setTintColor:NavigationBackArrowColor];
    //导航栏颜色
    [self.navigationBar setBarTintColor:NavigationBarColor];
    
    //导航栏标题颜色
    NSDictionary *dict = [NSDictionary dictionaryWithObject:NavigationTitleColor forKey:NSForegroundColorAttributeName];
    self.navigationBar.titleTextAttributes=dict;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
