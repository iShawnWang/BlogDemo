//
//  ZhiHuStory.m
//  JSONModelDemo
//
//  Created by pi on 16/3/1.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "ZhiHuStory.h"

@implementation ZhiHuStory

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    if([propertyName isEqualToString:@"multipic"]){
        return YES;
    }
    return [super propertyIsOptional:propertyName];
}

+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"ID"}];
}
@end
