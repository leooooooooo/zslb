//
//  MainTabBarViewController.m
//  wlkg
//
//  Created by zhangchao on 15/6/24.
//  Copyright (c) 2015年 leo. All rights reserved.
//

#import "zslbMainTabBarViewController.h"
#import "zslbindexViewController.h"
//#import "CustomerViewController.h"
//#import "EmployeeViewController.h"
//#import "SettingTableViewController.h"
#import "Header.h"

@interface zslbMainTabBarViewController ()

@end

@implementation zslbMainTabBarViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.NavigationDelegate setneedSwipeShowMenu:true];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.NavigationDelegate setneedSwipeShowMenu:false];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    self.navigationItem.title =item.title;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
    //返回按钮
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backButton];
    //导航栏标题
    self.navigationItem.title =PAGE1;
    //[(AppDelegate *)[[UIApplication sharedApplication]delegate]UserName];
    //导航栏左按钮
    //self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[self reSizeImage:[UIImage imageNamed:@"登录_07"] toSize:CGSizeMake(20, 24)] style:UIBarButtonItemStylePlain target:self.navigationController action:@selector(toggleMenu)];
    
    //退出登陆button
    /*
     UIBarButtonItem *logoutButton =[[UIBarButtonItem alloc]initWithTitle:@"登出" style:UIBarButtonItemStylePlain target:self action:@selector(Logout)];
     [self.navigationItem setRightBarButtonItem:logoutButton];
     */
    //菜单BUTTON
    //UIBarButtonItem *Menu = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"the_arrow"] style:UIBarButtonItemStylePlain target:self action:@selector(showMenu)];
    //[self.navigationItem setLeftBarButtonItem:Menu];
    
    
    // Do any additional setup after loading the view.
    
    
    zslbIndexViewController *index  = [[zslbIndexViewController alloc]init];
    /*
    CustomerViewController *MyApp =[[CustomerViewController alloc]init];
    EmployeeViewController *signin =[[EmployeeViewController alloc]init];
    SettingTableViewController *message = [[SettingTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
    */
    self.viewControllers = [NSArray arrayWithObjects:index, nil];
    
    UITabBarItem *tabBarItem1 = [self.tabBar.items objectAtIndex:0];
    /*
    UITabBarItem *tabBarItem2 = [self.tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [self.tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4 = [self.tabBar.items objectAtIndex:3];
    */
    tabBarItem1.title = PAGE1;
    /*
    tabBarItem2.title = PAGE2;
    tabBarItem3.title = PAGE3;
    tabBarItem4.title = PAGE4;
    */
    tabBarItem1.image = [UIImage imageNamed:@"tab1"];
    /*
     tabBarItem2.image = [UIImage imageNamed:@"icon2_20"];
    tabBarItem3.image = [UIImage imageNamed:@"icon2_22"];
    tabBarItem4.image = [UIImage imageNamed:@"icon2_24"];
    */
    
     /*
     tabBarItem1.selectedImage = [UIImage imageNamed:@"icon1_18"];
     tabBarItem2.selectedImage = [UIImage imageNamed:@"icon1_20"];
     tabBarItem3.selectedImage = [UIImage imageNamed:@"icon1_22"];
     tabBarItem4.selectedImage = [UIImage imageNamed:@"icon1_24"];
     */
    self.tabBar.tintColor = [UIColor orangeColor];
    [self.tabBar setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar setBarTintColor:TabBarColor];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor whiteColor
                                                        ], NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateNormal];
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
