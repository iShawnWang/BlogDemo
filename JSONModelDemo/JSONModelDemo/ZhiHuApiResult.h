//
//  ZhiHuApiResult.h
//  JSONModelDemo
//
//  Created by pi on 16/3/1.
//  Copyright © 2016年 pi. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "ZhiHuStory.h"
#import "JSONValueTransformer+CustomDate.h"

@protocol ZhiHuStory <NSObject>@end

@interface ZhiHuApiResult : JSONModel
@property (copy,nonatomic) NSDate *date;
@property (strong,nonatomic) NSArray<ZhiHuStory> *stories;
@end
