//
//  ZhiHuApiResult.m
//  JSONModelDemo
//
//  Created by pi on 16/3/1.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "ZhiHuApiResult.h"

@implementation ZhiHuApiResult
+(BOOL)propertyIsIgnored:(NSString *)propertyName{
    if([propertyName isEqualToString:@"top_stories"]){
        return YES;
    }
    return [super propertyIsIgnored:propertyName];
}
@end
