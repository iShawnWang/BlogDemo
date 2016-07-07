//
//  Joke.m
//  CellSizeCacheDemo
//
//  Created by pi on 16/6/25.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "Joke.h"

@implementation Joke
+(instancetype)jokeWithContent:(NSString*)content{
    Joke *joke= [Joke new];
    joke.content=content;
    joke.repeatCount=1;
    joke.objectID=[[NSProcessInfo processInfo] globallyUniqueString];
    joke.imageName=[NSString stringWithFormat:@"images%@",@([Joke randomInt:7])]; //随机图片
    return joke;
}

+(NSArray*)loadJokeFromPlist{
    NSURL *url= [[NSBundle mainBundle]URLForResource:@"duanzi" withExtension:@"plist"];
    NSArray *rawJokes =[[NSArray alloc]initWithContentsOfURL:url];
    NSMutableArray *jokes=[NSMutableArray array];
    [rawJokes enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *dict=obj;
        NSString *content= dict[@"text"];
        content=[content stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
        content=[content stringByAppendingString:@"\n"];
        Joke *joke= [Joke jokeWithContent:content];
        [jokes addObject:joke];
    }];
    return jokes;
}

#pragma mark - ModelSizeCacheProtocol
-(NSString *)modelID{
    return self.objectID;
}

/**
 *
 *
 *  @return random int between 1 to n
 */
+(NSUInteger)randomInt:(NSUInteger)toInt{
    return arc4random_uniform((u_int32_t)toInt)+1;
}
@end
