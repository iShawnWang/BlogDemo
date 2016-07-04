//
//  ViewController.m
//  JazzHandsDemo
//
//  Created by pi on 16/2/23.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "ViewController.h"
#import "UIView+PiAdditions.h"
#import <IFTTTJazzHands.h>

#define PageCount 3
#define ViewSize 30


@interface ViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong,nonatomic) UIView *v;
@property (strong,nonatomic) IFTTTAnimator *animator;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animator=[[IFTTTAnimator alloc]init];
    //
    self.scrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
    self.scrollView.pagingEnabled=YES;
    self.scrollView.backgroundColor=[UIColor whiteColor];
    self.scrollView.contentSize=CGSizeMake(self.view.boundWidth*PageCount,0);
    self.scrollView.delegate=self;
    [self.view addSubview:self.scrollView];
    //
    self.v=[[UIView alloc]initWithFrame:CGRectMake(100,200, ViewSize, ViewSize)];
    self.v.backgroundColor=[UIColor blueColor];

    [self.scrollView addSubview:self.v];
    
    [self setupAnimation];
}

-(void)setupAnimation{
    IFTTTAlphaAnimation *alpha=[IFTTTAlphaAnimation animationWithView:self.v];
    IFTTTTranslationAnimation *tran=[IFTTTTranslationAnimation animationWithView:self.v];
    
    [self.animator addAnimation:tran];
    [self.animator addAnimation:alpha];

    //
    [tran addKeyframeForTime:0 translation:CGPointMake(0, 0)];
    [tran addKeyframeForTime:200 translation:CGPointMake(150, 60)];
    
    [alpha addKeyframeForTime:0 alpha:1.0];
    [alpha addKeyframeForTime:200 alpha:0.0];
}


#pragma mark - 
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.animator animate:scrollView.contentOffset.x];
}
@end
