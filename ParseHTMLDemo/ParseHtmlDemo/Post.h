//
//  Post.h
//  ParseHtmlDemo
//
//  Created by pi on 16/4/12.
//  Copyright © 2016年 pi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ONOXMLElement;

@interface Post : NSObject
@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *postDate;
@property (copy,nonatomic) NSString *postUrl;

+(NSArray*)getNewPosts;
+(instancetype)postWithHtmlStr:(ONOXMLElement*)element;
@end
