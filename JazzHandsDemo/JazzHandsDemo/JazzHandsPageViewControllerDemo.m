//
//  JazzHandsPageViewControllerDemo.m
//  JazzHandsDemo
//
//  Created by pi on 16/2/25.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "JazzHandsPageViewControllerDemo.h"
#import <Masonry.h>

@interface JazzHandsPageViewControllerDemo ()
@property (strong,nonatomic) UIView  *v;
@end

@implementation JazzHandsPageViewControllerDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.v=[UIView new];
    self.v.backgroundColor=[UIColor redColor];
    [self.contentView addSubview:self.v];
    self.scrollView.showsHorizontalScrollIndicator=YES;
    self.scrollView.backgroundColor=[UIColor whiteColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@30);
    }];
    
    [self keepView:self.v onPage:0];
    
    IFTTTAlphaAnimation *alpha=[IFTTTAlphaAnimation animationWithView:self.v];
    [self.animator addAnimation:alpha];
    
    [alpha addKeyframeForTime:0 alpha:1];
    [alpha addKeyframeForTime:1 alpha:0];
}

@end
