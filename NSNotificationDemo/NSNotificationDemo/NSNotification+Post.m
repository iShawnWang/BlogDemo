//
//  NSNotification+Post.m
//
//  Created by pi on 16/3/14.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "NSNotification+Post.h"

@implementation NSNotification (Post)
-(void)post{
    [[NSNotificationCenter defaultCenter]postNotification:self];
}
@end
