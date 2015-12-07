//
//  ZHFXViewController.m
//  wlkg
//
//  Created by zhangchao on 15/6/9.
//  Copyright (c) 2015年 leo. All rights reserved.
//

#import "zslbFunctionListTableViewController.h"
#import "Header.h"
#import "AppDelegate.h"
#import "zslbJRZYTableViewController.h"
#import "zslbBYZYQKTableViewController.h"
#import "zslbBJCXTableViewController.h"
#import "zslbJRWLLQTableViewController.h"
#import <Leo/Leo.h>


@interface zslbFunctionListTableViewController ()
@end

@implementation zslbFunctionListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.delegate = [[UIApplication sharedApplication]delegate];

    
    //初始化二级菜单
    
    //self.delegate.FunctionList =
    // Do any additional setup after loading the view.
    [Header NavigationConifigInitialize:self];

    
    self.view.backgroundColor =[UIColor whiteColor];
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.List.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[self customCellByXib:tableView withIndexPath:indexPath];
    
    //通过nib自定义cell
    
    
    
    //default:assert(cell !=nil);
    //break;
    
    
    
    return cell;
}



//修改行高度的位置
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

//通过nib文件自定义cell
-(UITableViewCell *)customCellByXib:(UITableView *)tableView withIndexPath:(NSIndexPath *)indexPath{
    static NSString *customXibCellIdentifier = @"CustomXibCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:customXibCellIdentifier];
    if(cell == nil){
        //使用默认的UITableViewCell,但是不使用默认的image与text，改为添加自定义的控件
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:customXibCellIdentifier];
        
        //头像
        CGRect imageRect = CGRectMake(8, 5, 35, 35);
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:imageRect];
        imageView.tag = 2;
        
        //为图片添加边框
        CALayer *layer = [imageView layer];
        layer.cornerRadius = 8;
        layer.borderColor = [[UIColor whiteColor]CGColor];
        layer.borderWidth = 1;
        layer.masksToBounds = YES;
        [cell.contentView addSubview:imageView];
        
        //发送者
        CGPoint i =imageRect.origin;
        CGSize j = imageRect.size;
        CGRect nameRect = CGRectMake(i.x+j.width+10, i.y+13, WIDTH/1.5, 10);
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:nameRect];
        nameLabel.font = [UIFont systemFontOfSize:16];
        nameLabel.tag = 1;
        //nameLabel.textColor = [UIColor brownColor];
        [cell.contentView addSubview:nameLabel];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }

    //姓名
    ((UILabel *)[cell.contentView viewWithTag:1]).text = [self.List objectAtIndex:indexPath.row];
    
    //图标
    ((UIImageView *)[cell.contentView viewWithTag:2]).image = [UIImage imageNamed:[NSString stringWithFormat:@"%@1",self.title]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *FunctionName =[self.List objectAtIndex:indexPath.row];
    NSLog(FunctionName,nil);
    //NSArray *a =[ext FunctionList];
    int mark = (int)[[ext FunctionList] indexOfObject:FunctionName];
    
    UIViewController *vc = [[UIViewController alloc]init];

    vc.view.backgroundColor = [UIColor whiteColor];
    
    switch (mark) {
        case 1:{
            vc = [Web BaseWeb:[@"http://m.baidu.com/s?from=1099b&word=天气预报&s2bd=t" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        };
            break;
        case 2:{
            //vc = [[zslbJRZYTableViewController alloc]init];
        };
            break;
        case 3:{
            vc = [[zslbJRZYTableViewController alloc]init];
        };
            break;
        case 4:{
            vc = [[zslbBYZYQKTableViewController alloc]init];
        };
            break;
        case 5:{
            NSDictionary *dic = [Post getSynchronousRequestDataJSONSerializationWithURL:[NSString stringWithFormat:Server,@"M_zslb/Service/BusinessInformation/GetTodayBusinessInformation.aspx"] withHTTPBody:nil];
            NSDictionary *data = [dic objectForKey:@"Data"];
            vc =[Table DetailTable:data];
        };
            break;
        case 6:{
            NSDictionary *dic = [Post getSynchronousRequestDataJSONSerializationWithURL:[NSString stringWithFormat:Server,@"M_zslb/Service/BusinessInformation/GetMonthBusinessInformation.aspx"] withHTTPBody:nil];
            NSDictionary *data = [dic objectForKey:@"Data"];
            vc =[Table DetailTable:data];
        };
            break;
        case 7:{
            vc = [[zslbBJCXTableViewController alloc]init];
        };
            break;
        case 8:{
            NSDictionary *dic = [Post getSynchronousRequestDataJSONSerializationWithURL:[NSString stringWithFormat:Server,@"M_zslb/Service/MaterialConsumption/GetTodayMaterialInStorage.aspx"] withHTTPBody:nil];
            NSArray *array = [dic objectForKey:@"Data"];
            NSMutableDictionary *data = [[NSMutableDictionary alloc]init];
            for (int i =0; i<array.count; i++) {
                [data setValue:(NSString *)[[array objectAtIndex:i]objectAtIndex:1] forKey:(NSString *)[[array objectAtIndex:i]objectAtIndex:0]];
            }
            vc =[Table DetailTable:data];
        };
            break;
        case 9:{
            vc = [[zslbJRWLLQTableViewController alloc]init];
        };
            break;
        case 10:{
            NSDictionary *dic = [Post getSynchronousRequestDataJSONSerializationWithURL:[NSString stringWithFormat:Server,@"M_zslb/Service/MaterialConsumption/GetMonthMaterialInStorage.aspx"] withHTTPBody:nil];
            NSArray *array = [dic objectForKey:@"Data"];
            NSMutableDictionary *data = [[NSMutableDictionary alloc]init];
            for (int i =0; i<array.count; i++) {
                [data setValue:(NSString *)[[array objectAtIndex:i]objectAtIndex:1] forKey:(NSString *)[[array objectAtIndex:i]objectAtIndex:0]];
            }
            vc =[Table DetailTable:data];
        };
            break;
        case 11:{
            NSDictionary *dic = [Post getSynchronousRequestDataJSONSerializationWithURL:[NSString stringWithFormat:Server,@"M_zslb/Service/MaterialConsumption/GetMonthMaterialOutStorage.aspx"] withHTTPBody:nil];
            NSArray *array = [dic objectForKey:@"Data"];
            NSMutableDictionary *data = [[NSMutableDictionary alloc]init];
            for (int i =0; i<array.count; i++) {
                [data setValue:(NSString *)[[array objectAtIndex:i]objectAtIndex:1] forKey:(NSString *)[[array objectAtIndex:i]objectAtIndex:0]];
            }
            vc =[Table DetailTable:data];
        };
            break;
        default:
            break;
            
    }
    
    
    vc.title = FunctionName;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
