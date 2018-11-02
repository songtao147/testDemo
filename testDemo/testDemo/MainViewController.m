//
//  MainViewController.m
//  testDemo
//
//  Created by songtao on 2018/9/27.
//  Copyright © 2018年 ryan. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (nonatomic) NSMutableArray *dataArr;

@end

static NSString *reuseIdentifier = @"MainTableViewCellReuseIdentifier";

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"测试demo";    
    
    _dataArr = [NSMutableArray array];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"测试页面", @"Test", nil];
    [_dataArr addObject:dic];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"登录相关(验证码、支付密码输入)", @"LoginTest", nil];
    [_dataArr addObject:dic1];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"常见动画特效", @"Animations", nil];
    [_dataArr addObject:dic2];
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:@"文本转语音（英语翻译）", @"TTS", nil];
    [_dataArr addObject:dic3];
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:@"设计模式", @"DesignPatterns", nil];
    [_dataArr addObject:dic4];
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseIdentifier];//必需注册
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorInset = UIEdgeInsetsZero;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return _dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *dic = [_dataArr objectAtIndex:indexPath.row];
    cell.textLabel.text = dic.allValues.firstObject;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *dic = [_dataArr objectAtIndex:indexPath.row];
    NSString *classString = [NSString stringWithFormat:@"%@ViewController", dic.allKeys.firstObject];
    Class cls = NSClassFromString(classString);
    UIViewController *controller = [[cls alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

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
