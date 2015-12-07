
//
//  zslbJRZYTableViewController.m
//  zslb
//
//  Created by zhangchao on 15/12/1.
//  Copyright © 2015年 leo. All rights reserved.
//

#import "zslbJRZYTableViewController.h"
#import <Leo/Leo.h>
#import "Header.h"

@interface zslbJRZYTableViewController ()
@property(nonatomic,retain) NSArray *array;
@end

@implementation zslbJRZYTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dic = [Post getSynchronousRequestDataJSONSerializationWithURL:[NSString stringWithFormat:Server,@"M_zslb/Service/Operation/GetTodayOperation.aspx"] withHTTPBody:nil];
    _array = [[NSArray alloc]initWithArray:[dic objectForKey:@"Data"]];
    
    self.tableView.sectionHeaderHeight = 44;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.backgroundColor = [UIColor whiteColor];

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
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *customXibCellIdentifier = @"CustomXibCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:customXibCellIdentifier];
    if(cell == nil)
    {
        //使用默认的UITableViewCell,但是不使用默认的image与text，改为添加自定义的控件
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:customXibCellIdentifier];
        
        //Date
        CGRect DateRect = CGRectMake(20,11,50,22);
        CGPoint i = DateRect.origin;
        //CGSize j = DateRect.size;
        UILabel *DateLabel = [[UILabel alloc]initWithFrame:DateRect];
        DateLabel.font = [UIFont systemFontOfSize:16];
        DateLabel.tag = 1;
        //nameLabel.textColor = [UIColor brownColor];
        DateLabel.textAlignment= NSTextAlignmentCenter;
        
        [cell.contentView addSubview:DateLabel];
        
        //Fund
        CGRect FundRect = CGRectMake(WIDTH/2-65, i.y, 50, 22);
        UILabel *FundLabel = [[UILabel alloc]initWithFrame:FundRect];
        i = FundRect.origin;
        //j = FundRect.size;
        FundLabel.font = [UIFont systemFontOfSize:16];
        FundLabel.tag = 2;
        FundLabel.textAlignment= NSTextAlignmentCenter;
        //nameLabel.textColor = [UIColor brownColor];
        [cell.contentView addSubview:FundLabel];
        
        //DOD
        CGRect DODRect = CGRectMake(WIDTH/2, i.y, 85, 22);
        UILabel *DODLabel = [[UILabel alloc]initWithFrame:DODRect];
        DODLabel.font = [UIFont systemFontOfSize:16];
        DODLabel.tag = 3;
        DODLabel.textAlignment= NSTextAlignmentCenter;
        //DODLabel.textColor = [UIColor whiteColor];
        [cell.contentView addSubview:DODLabel];
        //aaa
        CGRect aaaRect = CGRectMake(WIDTH-95, i.y, 85, 22);
        UILabel *aaaLabel = [[UILabel alloc]initWithFrame:aaaRect];
        aaaLabel.font = [UIFont systemFontOfSize:16];
        aaaLabel.tag = 4;
        aaaLabel.textAlignment= NSTextAlignmentCenter;
        //aaaLabel.textColor = [UIColor whiteColor];
        [cell.contentView addSubview:aaaLabel];
    }
    
    //Date
    ((UILabel *)[cell.contentView viewWithTag:1]).text = [[self.array objectAtIndex:indexPath.row]objectAtIndex:0];
    //Fund
    ((UILabel *)[cell.contentView viewWithTag:2]).text = [[self.array objectAtIndex:indexPath.row]objectAtIndex:1];
    //DOD
    ((UILabel *)[cell.contentView viewWithTag:3]).text = [[self.array objectAtIndex:indexPath.row]objectAtIndex:2];
    //aaa
    ((UILabel *)[cell.contentView viewWithTag:4]).text = [[self.array objectAtIndex:indexPath.row]objectAtIndex:3];
    cell.userInteractionEnabled = NO;
    return cell;
}



//修改行高度的位置
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

//头部
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* myView = [[UIView alloc] init];
    myView.backgroundColor = [UIColor colorWithRed:0.10 green:0.68 blue:0.94 alpha:0.95];
    //Date
    UILabel *Date = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 80, 20)];
    CGPoint i = Date.frame.origin;
    //CGSize  j = Date.frame.size;
    Date.textColor=[UIColor whiteColor];
    Date.backgroundColor = [UIColor clearColor];
    Date.text=@"作业类型";
    Date.textAlignment= NSTextAlignmentCenter;
    [myView addSubview:Date];
    //Fund
    UILabel *Fund = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2-65, i.y, 50, 20)];
    i = Fund.frame.origin;
    ///j = Fund.frame.size;
    Fund.textColor=[UIColor whiteColor];
    Fund.backgroundColor = [UIColor clearColor];
    Fund.text=@"艘次";
    Fund.textAlignment= NSTextAlignmentCenter;
    [myView addSubview:Fund];
    //DOD
    UILabel *DOD = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2, i.y, 85, 20)];
    DOD.textColor=[UIColor whiteColor];
    DOD.backgroundColor = [UIColor clearColor];
    DOD.text=@"拖轮数";
    DOD.textAlignment= NSTextAlignmentCenter;
    [myView addSubview:DOD];
    //aaa
    UILabel *aaa = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-95, i.y, 85, 20)];
    aaa.textColor=[UIColor whiteColor];
    aaa.backgroundColor = [UIColor clearColor];
    aaa.text=@"调度员";
    aaa.textAlignment= NSTextAlignmentCenter;
    [myView addSubview:aaa];
    return myView;
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
