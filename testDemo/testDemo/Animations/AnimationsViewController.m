//
//  AnimationsViewController.m
//  testDemo
//
//  Created by songtao on 2018/10/31.
//  Copyright © 2018 ryan. All rights reserved.
//  整理 动画特效demo 使用(https://github.com/ZLFighting/-ZLDemo)

#import "AnimationsViewController.h"

@interface AnimationsViewController ()

@property (nonatomic, strong) NSMutableArray *titleNames;

@property (nonatomic, strong) NSMutableArray *classNames;

@end

@implementation AnimationsViewController

static NSString *reuseIdentifier = @"AnimationsCellReuseIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"常见动画特效";
    
    self.classNames = @[].mutableCopy;
    self.titleNames = @[].mutableCopy;
    
    [self addTitle:@"广播跑马灯" class:@"Broadcasting"];
    [self addTitle:@"弹幕动画" class:@"Barrage"];
    [self addTitle:@"直播点赞动画" class:@"LiveHeart"];
    [self addTitle:@"直播点赞图片动画" class:@"LikePicture"];
    [self addTitle:@"烟花动画" class:@"Fireworks"];
    [self addTitle:@"雪花动画" class:@"Snowflake"];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseIdentifier];//必需注册
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorInset = UIEdgeInsetsZero;
}

- (void)addTitle:(NSString *)title class:(NSString *)className {
    
    [self.classNames addObject:className];
    [self.titleNames addObject:title];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _titleNames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [_titleNames objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    NSString *classString = [NSString stringWithFormat:@"%@ViewController", _classNames[indexPath.row]];
    Class cls = NSClassFromString(classString);
    if (cls) {
        UIViewController *controller = [[cls alloc] init];
        controller.title = [_titleNames objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:controller animated:YES];
    }
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
