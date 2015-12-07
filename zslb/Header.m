//
//  Header1.m
//  wlkg
//
//  Created by zhangchao on 15/7/28.
//  Copyright (c) 2015年 leo. All rights reserved.
//

#import "Header.h"

@implementation Header

+(void)NavigationConifigInitialize:(UIViewController *)sender
{

    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [sender.navigationItem setBackBarButtonItem:backButton];
    [sender.navigationController.navigationBar setTintColor:NavigationBackArrowColor];
    [sender.navigationController.navigationBar setBarTintColor:NavigationBarColor];
    NSDictionary *dict = [NSDictionary dictionaryWithObject:NavigationTitleColor forKey:NSForegroundColorAttributeName];
    sender.navigationController.navigationBar.titleTextAttributes=dict;
}

+(NSArray *)FunctionListInitialize
{
    return [[NSArray alloc]initWithObjects:
            @"掌上轮驳功能列表",
            @"今日天气情况",//1
            @"今日船员出勤情况",//2
            @"今日作业情况",//3
            @"本月作业情况",//4
            @"今日商务信息",//5
            @"本月商务信息",//6
            @"报警查询",//7
            @"今日物料入库",//8
            @"今日物料领料",//9
            @"本月物料入库",//10
            @"本月物料领料",//11
            @"今日能源消耗",//12
            @"本月能源消耗",//13
            /*
            @"报关",//14
            @"报检",//15
            @"要闻资讯",//16
            @"领导讲话",//17
            @"基层动态",//18
            @"党建新闻",//19
            @"货运业务",//20
            @"船务业务",//21
            @"货运财务",//22
            @"船务财务",//23
            @"设备运行记录",//24
            @"设备台账记录",//25
            @"经营情况",//26
            @"开票审批",//27
            @"员工通讯录",//28
            @"企业通讯录",//29
            @"保税部经营情况",//30
            @"客户经营情况",//31
            @"配送业务",//32
            @"配送财务",//33
            @"保税业务管理中心",//34
            @"保税财务管理中心",//35
            @"仓储业务管理中心",//36
            @"仓储财务管理中心",//37
             */
            nil];

}
@end
