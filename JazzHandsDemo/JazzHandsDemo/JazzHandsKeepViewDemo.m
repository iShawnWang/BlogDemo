//
//  JazzHandsKeepViewDemo.m
//  JazzHandsDemo
//
//  Created by pi on 16/2/25.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "JazzHandsKeepViewDemo.h"

@interface JazzHandsKeepViewDemo ()
@property (strong,nonatomic) UIImageView *ifttt;
@end

@implementation JazzHandsKeepViewDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ifttt=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"IFTTTPresents"]];
    self.scrollView.backgroundColor=[UIColor greenColor];
    self.scrollView.showsHorizontalScrollIndicator=YES;
    [self.contentView addSubview:self.ifttt];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
//    [self keepView:self.ifttt onPage:0]; //固定在第一页中间
    
//    [self keepView:self.ifttt onPages:@[@(0),@(1)]]; //固定在第一页第二页中间
    
//    [self keepView:self.ifttt onPages:@[@(0),@(1)] atTimes:@[@(0),@(1)]]; //和上面的那个一样
    
    [self keepView:self.ifttt onPages:@[@(0),@(1.5)] atTimes:@[@(0),@(1)]]; //说明我们调整这个pages 参数就能做出 x 轴平移的效果了..
}

-(NSUInteger)numberOfPages{
    return 4;
}
@end
