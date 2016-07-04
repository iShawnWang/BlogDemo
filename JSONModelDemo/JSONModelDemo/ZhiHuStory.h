//
//  ZhiHuStory.h
//  JSONModelDemo
//
//  Created by pi on 16/3/1.
//  Copyright © 2016年 pi. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ZhiHuStory : JSONModel

@property (copy,nonatomic) NSString *ga_prefix;
@property (copy,nonatomic) NSString *ID;
@property (copy,nonatomic) NSArray *images;
@property (copy,nonatomic) NSString *title;
@property (assign,nonatomic) NSInteger type;
@property (assign,nonatomic) BOOL multipic; //文章内容,多图
//@property (assign,nonatomic) NSValue<Optional> *multipic; //或者这样写,不用 Override [propertyIsOptional:propertyName:];

@end
