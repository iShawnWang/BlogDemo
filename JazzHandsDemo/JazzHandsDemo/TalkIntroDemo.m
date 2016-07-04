//
//  TalkIntroDemo.m
//  JazzHandsDemo
//
//  Created by pi on 16/2/23.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "TalkIntroDemo.h"
#import "UIView+PiAdditions.h"
#import <IFTTTJazzHands.h>

#define NUMBER_OF_PAGES 3

#define PageWidth self.view.boundWidth

#define PageHeight self.view.boundHeight

#define timeForPage(page) (NSInteger)(PageWidth * (page - 1))

@interface TalkIntroDemo ()<UIScrollViewDelegate>
@property (strong,nonatomic) UIScrollView *scrollView;
@property (strong,nonatomic) IFTTTAnimator *animator;
@property (strong,nonatomic) UIImageView *point1;
@property (strong,nonatomic) UIImageView *point2;
@property (strong,nonatomic) UIImageView *point3;
@end

@implementation TalkIntroDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self setupAnimation];
}

-(void)setupView{
    self.scrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
    self.scrollView.delegate=self;
    self.scrollView.backgroundColor=[UIColor whiteColor];
    self.scrollView.pagingEnabled=YES;
    self.scrollView.contentSize=CGSizeMake(self.view.boundWidth*NUMBER_OF_PAGES,0);
    self.animator=[IFTTTAnimator new];
    //
    self.point1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"RedPoint"]];
    self.point2=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pdfIcon"]];
    self.point3=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CategoryIcon"]];
    //
    self.point1.center=CGPointMake(PageWidth*0.5+80, PageHeight*0.5+80);
    self.point2.center=CGPointMake(PageWidth*1.5-80, PageHeight*0.5+80);
    self.point3.center=CGPointMake(PageWidth*2.5, PageHeight*0.5-80);
    //
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.point1];
    [self.scrollView addSubview:self.point2];
    [self.scrollView addSubview:self.point3];
}

-(void)setupAnimation{
    //Point1 位移
    IFTTTFrameAnimation *point1Frame=[IFTTTFrameAnimation animationWithView:self.point1];
    [self.animator addAnimation:point1Frame];
    
    [point1Frame addKeyframeForTime:timeForPage(1) frame:self.point1.frame];
    [point1Frame addKeyframeForTime:timeForPage(2) frame:self.point2.frame];
    
    //Point2 位移
    IFTTTFrameAnimation *point2Frame=[IFTTTFrameAnimation animationWithView:self.point2];
    [self.animator addAnimation:point2Frame];
    
    [point2Frame addKeyframeForTime:timeForPage(1) frame:self.point1.frame];
    [point2Frame addKeyframeForTime:timeForPage(2) frame:self.point2.frame];
    
    
    //Point1 透明度
    IFTTTAlphaAnimation *point1Alpha=[IFTTTAlphaAnimation animationWithView:self.point1];
    [self.animator addAnimation:point1Alpha];

    [point1Alpha addKeyframeForTime:timeForPage(1) alpha:1.0];
    [point1Alpha addKeyframeForTime:timeForPage(2) alpha:0.0];
    
    //Point2 透明度
    IFTTTAlphaAnimation *point2Alpha=[IFTTTAlphaAnimation animationWithView:self.point2];
    [self.animator addAnimation:point2Alpha];
    
    [point2Alpha addKeyframeForTime:timeForPage(1) alpha:0.0];
    [point2Alpha addKeyframeForTime:timeForPage(2) alpha:1.0];
    
    //让圆点2跟随圆点3运动并淡出
    [point2Frame addKeyframeForTime:timeForPage(3) frame:self.point3.frame];
    
    [point2Alpha addKeyframeForTime:timeForPage(3) alpha:0.0];
    
//
    //Point3 位移
    IFTTTFrameAnimation *point3Frame=[IFTTTFrameAnimation animationWithView:self.point3];
    [self.animator addAnimation:point3Frame];
    
    [point3Frame addKeyframeForTime:timeForPage(2) frame:self.point2.frame];
    [point3Frame addKeyframeForTime:timeForPage(3) frame:self.point3.frame];
    
    //Point3 透明度
    IFTTTAlphaAnimation *point3Alpha=[IFTTTAlphaAnimation animationWithView:self.point3];
    [self.animator addAnimation:point3Alpha];
   
    [point3Alpha addKeyframeForTime:timeForPage(2) alpha:0.0];
    [point3Alpha addKeyframeForTime:timeForPage(3) alpha:1.0];
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.animator animate:scrollView.contentOffset.x];
}

@end
