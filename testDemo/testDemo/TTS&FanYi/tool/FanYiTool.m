//
//  FanYiTool.m
//  testDemo
//
//  Created by songtao on 2018/9/27.
//  Copyright © 2018年 ryan. All rights reserved.
//

#import "FanYiTool.h"
#import "MyNetWorkManage.h"
#import "NSString+Encryption.h"
//百度翻译（http://api.fanyi.baidu.com/api/trans/product/apidoc）
#define HttpUrl @"http://api.fanyi.baidu.com/api/trans/vip/translate"
#define APPID @"20180927000212590"
#define APPKEY @"W3YKxY_Ajwoj_udvc2ij"

@implementation FanYiTool

+ (void)fanyiSrcStr:(NSString * _Nonnull)srcStr toResult:(void (^)(NSString * _Nonnull))result{
    
    NSString *salt = [NSString stringWithFormat:@"%010u", arc4random()%1000000000];
    NSString *sign = [NSString stringWithFormat:@"%@%@%@%@", APPID, srcStr, salt, APPKEY].MD5;
    NSString *urlStr = [NSString stringWithFormat:@"%@?q=%@&from=auto&to=%@&appid=%@&salt=%@&sign=%@", HttpUrl, srcStr, @"zh", APPID, salt, sign].URLEncode;
    
    [MyNetWorkManage requestWithUrlString:urlStr callBack:^(BOOL normalResult, id _Nonnull resultObj) {
        if (normalResult) {
            //NSLog(@"%@", resultObj);
            NSArray *transResult = resultObj[@"trans_result"];
            NSDictionary *dic = transResult.firstObject;
            result(dic[@"dst"]);
        }else{
            NSLog(@"error = %@", resultObj);
        }
    }];
}

@end
