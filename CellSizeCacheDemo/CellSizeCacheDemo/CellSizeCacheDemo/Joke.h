//
//  Joke.h
//  CellSizeCacheDemo
//
//  Created by pi on 16/6/25.
//  Copyright © 2016年 pi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelSizeCache.h"

@interface Joke : NSObject<ModelSizeCacheProtocol>
@property (copy,nonatomic) NSString *objectID;
@property (copy,nonatomic) NSString *content;
@property (copy,nonatomic) NSString *imageName;
@property (assign,nonatomic) NSInteger repeatCount; //文字内容重复次数,模拟 Model 中数据变化,重新计算高度的情况
+(instancetype)jokeWithContent:(NSString*)content;
+(NSArray*)loadJokeFromPlist;
@end
