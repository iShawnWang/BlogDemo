//
//  BackgroundColorDemo.m
//  JazzHandsDemo
//
//  Created by pi on 16/2/25.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "BackgroundColorDemo.h"
#import <Masonry.h>
#import "IFTTTCircleView.h"

@interface BackgroundColorDemo ()
@property (strong,nonatomic) IFTTTCircleView *circle;
@end

@implementation BackgroundColorDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.circle=[[IFTTTCircleView alloc]init];
    [self.contentView addSubview:self.circle];
    self.scrollView.showsHorizontalScrollIndicator=YES;
    
    [self setupScrollViewAnimation];
    [self setupCircleAnimation];
}

-(void)setupScrollViewAnimation{
    //让 scrollView 的背景色从第二页到第二页过一点点时变成蓝色
    IFTTTBackgroundColorAnimation *scrollBG=[IFTTTBackgroundColorAnimation animationWithView:self.scrollView];
    [scrollBG addKeyframeForTime:1 color:[UIColor colorWithRed:0.2f green:0.2f blue:0.2f alpha:1.f]];
    [scrollBG addKeyframeForTime:1.1 color:[UIColor colorWithRed:0.14f green:0.8f blue:1.f alpha:1.f]];
    [self.animator addAnimation:scrollBG];
}

-(void)setupCircleAnimation{
    //约束 circle
    [self.circle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(60);
        make.width.equalTo(self.scrollView).multipliedBy(0.8).priorityHigh();
        make.height.equalTo(self.circle.mas_width);
        make.centerY.equalTo(self.contentView).multipliedBy(0.8);
    }];
    [self keepView:self.circle onPages:@[@(0),@(1),@(2)]];
    
    //circle 的背景色从灰变蓝
    IFTTTBackgroundColorAnimation *circleColor=[IFTTTBackgroundColorAnimation animationWithView:self.circle];
    [circleColor addKeyframeForTime:0 color:[UIColor colorWithRed:0.4f green:0.4f blue:0.4f alpha:1.f]];
    [circleColor addKeyframeForTime:1 color:[UIColor colorWithRed:0.14f green:0.8f blue:1.f alpha:1.f]];
    [self.animator addAnimation:circleColor];
    
    //circle 放大
    IFTTTScaleAnimation *circleScaleAnimation = [IFTTTScaleAnimation animationWithView:self.circle];
    [circleScaleAnimation addKeyframeForTime:0 scale:1 withEasingFunction:IFTTTEasingFunctionEaseInQuad];
    [circleScaleAnimation addKeyframeForTime:1 scale:6];
    [self.animator addAnimation:circleScaleAnimation];
    
    //circle 在第二页过一点点时隐藏,此时 scrollView 的背景色和 circle 背景色相同,所以隐藏 circle 看起来不会有变化.
    IFTTTHideAnimation *circleHideAnimation=[IFTTTHideAnimation animationWithView:self.circle hideAt:1.1];
    [self.animator addAnimation:circleHideAnimation];
}

-(NSUInteger)numberOfPages{
    return 4;
}
@end
