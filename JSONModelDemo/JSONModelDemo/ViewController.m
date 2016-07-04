//
//  ViewController.m
//  JSONModelDemo
//
//  Created by pi on 16/3/1.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "ViewController.h"
#import <JSONModelLib.h>
#import "ZhiHuApiResult.h"

NSString *const kUrl=@"http://news-at.zhihu.com/api/4/news/latest";

@interface ViewController ()
@property (strong,nonatomic) ZhiHuApiResult *result;
@property (strong,nonatomic) NSArray *stories;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //示例 1
    [JSONHTTPClient getJSONFromURLWithString:kUrl completion:^(id json, JSONModelError *err) {
        NSDictionary *dict=(NSDictionary*)json;
        
        NSError *error;
        self.stories=[ZhiHuStory arrayOfModelsFromDictionaries:dict[@"stories"] error:&error];
    }];
    
    //示例 2
    [JSONHTTPClient getJSONFromURLWithString:kUrl completion:^(id json, JSONModelError *err) {
        
        NSDictionary *dict=(NSDictionary*)json;
        
        NSError *error;
        self.result=[[ZhiHuApiResult alloc]initWithDictionary:dict error:&error];
    }];
    
    //示例 3 ,示例2的简化方法
    [ZhiHuApiResult getModelFromURLWithString:kUrl completion:^(id model, JSONModelError *err) {
        self.result=model;
    }];
}


@end
