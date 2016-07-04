//
//  Post.m
//  ParseHtmlDemo
//
//  Created by pi on 16/4/12.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "Post.h"
#import <Ono.h>

static NSString *const kUrlStr=@"http://iShawn.wang";

@implementation Post
+(NSArray*)getNewPosts{
    NSMutableArray *array=[NSMutableArray array];
    NSData *data= [NSData dataWithContentsOfURL:[NSURL URLWithString:kUrlStr]];
    
    NSError *error;
    ONOXMLDocument *doc=[ONOXMLDocument HTMLDocumentWithData:data error:&error];
    ONOXMLElement *postsParentElement= [doc firstChildWithXPath:@"//*[@id='posts']"];
    [postsParentElement.children enumerateObjectsUsingBlock:^(ONOXMLElement *element, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"%@",element);
        Post *post=[Post postWithHtmlStr:element];
        if(post){
            [array addObject:post];
        }
    }];
    return array;
}

+(instancetype)postWithHtmlStr:(ONOXMLElement*)element{
    
    Post *p=[Post new];
    ONOXMLElement *titleElement= [element firstChildWithXPath:@"h2/a"];
    p.postUrl= [titleElement valueForAttribute:@"href"];
    p.title= [titleElement stringValue];
    ONOXMLElement *dateElement= [element firstChildWithXPath:@"div[2]/span[1]"];
    p.postDate= [dateElement stringValue];
    return p;
}

-(void)setPostUrl:(NSString *)postUrl{
    _postUrl=[kUrlStr stringByAppendingString:postUrl];
}
@end
