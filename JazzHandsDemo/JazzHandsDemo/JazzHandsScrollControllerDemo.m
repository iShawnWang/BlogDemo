//
//  JazzHandsScrollControllerDemo.m
//  JazzHandsDemo
//
//  Created by pi on 16/2/25.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "JazzHandsScrollControllerDemo.h"
@import UIKit;
#import "UIView+PiAdditions.h"

#define PageCount 3
#define ViewSize 30

@interface JazzHandsScrollControllerDemo ()<IFTTTAnimatedScrollViewControllerDelegate>
@property (strong,nonatomic) UIView *v;
@end

@implementation JazzHandsScrollControllerDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.contentSize=CGSizeMake(self.view.boundWidth*PageCount,0);
    self.scrollView.backgroundColor=[UIColor whiteColor];
    
    self.v=[[UIView alloc]initWithFrame:CGRectMake(100,200, ViewSize, ViewSize)];
    self.v.backgroundColor=[UIColor blueColor];
    [self.scrollView addSubview:self.v];
    
    self.delegate=self; //根据需要监听
    
    [self setupAnimation];
}

-(void)setupAnimation{
    IFTTTAlphaAnimation *alpha=[IFTTTAlphaAnimation animationWithView:self.v];
    IFTTTTranslationAnimation *tran=[IFTTTTranslationAnimation animationWithView:self.v];
    
    [self.animator addAnimation:tran];
    [self.animator addAnimation:alpha];
    
    [tran addKeyframeForTime:0 translation:CGPointMake(0, 0)];
    [tran addKeyframeForTime:200 translation:CGPointMake(150, 60)];
    
    [alpha addKeyframeForTime:0 alpha:1.0];
    [alpha addKeyframeForTime:200 alpha:0.0];
}

#pragma mark -
-(void)animatedScrollViewControllerDidScrollToEnd:(IFTTTAnimatedScrollViewController *)animatedScrollViewController{
    
}

-(void)animatedScrollViewControllerDidEndDraggingAtEnd:(IFTTTAnimatedScrollViewController *)animatedScrollViewController{
    
}
@end
