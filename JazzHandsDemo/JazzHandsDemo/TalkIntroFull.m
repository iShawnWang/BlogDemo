//
//  TalkIntroFull.m
//  JazzHandsDemo
//
//  Created by pi on 16/2/23.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "TalkIntroFull.h"
#import "UIView+PiAdditions.h"
#import <IFTTTJazzHands.h>

#define NUMBER_OF_PAGES 3

#define PageWidth self.view.boundWidth

#define PageHeight self.view.boundHeight

#define timeForPage(page) (NSInteger)(PageWidth * (page - 1))

@interface TalkIntroFull ()<UIScrollViewDelegate>
@property (strong,nonatomic) UIScrollView *scrollView;
@property (strong,nonatomic) IFTTTAnimator *animator;
//Page1
@property (strong,nonatomic) UIImageView *point1;
@property (strong,nonatomic) UIImageView *voiceGroup;
@property (strong,nonatomic) UIImageView *myVoice;
@property (strong,nonatomic) UIImageView *title1CN;

//Page2
@property (strong,nonatomic) UIImageView *point2;
@property (strong,nonatomic) UIImageView *searchField;
@property (strong,nonatomic) UIImageView *searchResult;
@property (strong,nonatomic) UIImageView *title2CN;

//Page3
@property (strong,nonatomic) UIImageView *point3;
@end

@implementation TalkIntroFull

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self layoutView];
    [self setupAnimationPage1];
    [self setupAnimationPage2];
    [self setupAnimationPage3];
}

-(void)setupView{
    self.scrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
    self.scrollView.delegate=self;
    self.scrollView.pagingEnabled=YES;
    self.scrollView.backgroundColor=[UIColor whiteColor];
    self.scrollView.contentSize=CGSizeMake(self.view.boundWidth*NUMBER_OF_PAGES,0);
    [self.view addSubview:self.scrollView];
    self.animator=[IFTTTAnimator new];
    //Page1
    self.point1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"RedPoint"]];
    self.voiceGroup=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"VoiceGroup"]];
    self.myVoice=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MyVoice"]];
    self.title1CN=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Title1CN"]];
    
    [self.scrollView addSubview:self.point1];
    [self.scrollView addSubview:self.voiceGroup];
    [self.scrollView addSubview:self.myVoice];
    [self.scrollView addSubview:self.title1CN];
    //Page2
    self.point2=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pdfIcon"]];
    self.searchField=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"SearchField"]];
    self.searchResult=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"SearchResult"]];
    self.title2CN=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Title2CN"]];
    
     [self.scrollView addSubview:self.point2];
     [self.scrollView addSubview:self.searchField];
     [self.scrollView addSubview:self.searchResult];
     [self.scrollView addSubview:self.title2CN];
    //Page3
    self.point3=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CategoryIcon"]];

    [self.scrollView addSubview:self.point3];

}

-(void)layoutView{
    //
    self.point1.center=CGPointMake(PageWidth*0.5+70, PageHeight*0.5+65);
    self.voiceGroup.center=CGPointMake(PageWidth*0.5, PageHeight*0.5);
    self.myVoice.center=CGPointMake(PageWidth*0.5+90, PageHeight*0.5+120);
    self.title1CN.center=CGPointMake(PageWidth*0.5, 0);
    //
    self.point2.center=CGPointMake(PageWidth*1.5-85, PageHeight*0.5+65);
    self.searchField.center=CGPointMake(PageWidth*1.5, PageHeight*0.5-90);
    self.searchResult.center=CGPointMake(PageWidth*1.5, PageHeight*0.5+40);
    self.title2CN.center=CGPointMake(PageWidth*1.5, 0);
    //
    self.point3.center=CGPointMake(PageWidth*2.5, PageHeight*0.5-80);
}

-(void)setupAnimationPage1{
    //Point1
    IFTTTFrameAnimation *point1Frame=[IFTTTFrameAnimation animationWithView:self.point1];
    IFTTTAlphaAnimation *point1Alpha=[IFTTTAlphaAnimation animationWithView:self.point1];
    [self.animator addAnimation:point1Frame];
    [self.animator addAnimation:point1Alpha];
    
    [point1Frame addKeyframeForTime:timeForPage(1) frame:self.point1.frame];
    [point1Frame addKeyframeForTime:timeForPage(2) frame:self.point2.frame];
    
    [point1Alpha addKeyframeForTime:timeForPage(1) alpha:1.0];
    [point1Alpha addKeyframeForTime:timeForPage(2) alpha:0.0];
    
    //TitleView1
    IFTTTFrameAnimation *title1Frame=[IFTTTFrameAnimation animationWithView:self.title1CN];
    [self.animator addAnimation:title1Frame];
    
    [title1Frame addKeyframeForTime:timeForPage(1) frame:self.title1CN.frame];
    [title1Frame addKeyframeForTime:timeForPage(2) frame:self.title2CN.frame];
    
    IFTTTAlphaAnimation *title1Alpha=[IFTTTAlphaAnimation animationWithView:self.title1CN];
    [self.animator addAnimation:title1Alpha];
    
    [title1Alpha addKeyframeForTime:timeForPage(1) alpha:1.0];
    [title1Alpha addKeyframeForTime:timeForPage(2) alpha:0.0];
    
    //myVoice
    IFTTTTranslationAnimation *myVoiceTran=[IFTTTTranslationAnimation animationWithView:self.myVoice];
    [self.animator addAnimation:myVoiceTran];
    
    [myVoiceTran addKeyframeForTime:timeForPage(1) translation:CGPointZero];
    [myVoiceTran addKeyframeForTime:timeForPage(2) translation:CGPointMake(PageWidth*2, 0)];
}

-(void)setupAnimationPage2{
    //Point2
    IFTTTFrameAnimation *point2Frame=[IFTTTFrameAnimation animationWithView:self.point2];
    IFTTTAlphaAnimation *point2Alpha=[IFTTTAlphaAnimation animationWithView:self.point2];
    [self.animator addAnimation:point2Frame];
    [self.animator addAnimation:point2Alpha];
    
    [point2Frame addKeyframeForTime:timeForPage(1) frame:self.point1.frame];
    [point2Frame addKeyframeForTime:timeForPage(2) frame:self.point2.frame];
    [point2Frame addKeyframeForTime:timeForPage(3) frame:self.point3.frame];
    
    [point2Alpha addKeyframeForTime:timeForPage(1) alpha:0.0];
    [point2Alpha addKeyframeForTime:timeForPage(2) alpha:1.0];
    [point2Alpha addKeyframeForTime:timeForPage(3) alpha:0.0];
    
    //TitleView2
    
    IFTTTFrameAnimation *title2Frame=[IFTTTFrameAnimation animationWithView:self.title2CN];
    [self.animator addAnimation:title2Frame];
    
    [title2Frame addKeyframeForTime:timeForPage(1) frame:self.title1CN.frame];
    [title2Frame addKeyframeForTime:timeForPage(2) frame:self.title2CN.frame];
    
    IFTTTAlphaAnimation *title2Alpha=[IFTTTAlphaAnimation animationWithView:self.title2CN];
    [self.animator addAnimation:title2Alpha];
    
    [title2Alpha addKeyframeForTime:timeForPage(1) alpha:0.0];
    [title2Alpha addKeyframeForTime:timeForPage(2) alpha:1.0];
    
    
    //searchField
    IFTTTAlphaAnimation *searchFieldAlpha=[IFTTTAlphaAnimation animationWithView:self.searchField];
    [self.animator addAnimation:searchFieldAlpha];
    
    
    [searchFieldAlpha addKeyframeForTime:timeForPage(1) alpha:0.0 ];
//    [searchFieldAlpha addKeyframeForTime:timeForPage(2) alpha:1.0];
    [searchFieldAlpha addKeyframeForTime:timeForPage(2) alpha:1.0 withEasingFunction:IFTTTEasingFunctionEaseInOutCubic];
    
    //searchResult
    IFTTTTranslationAnimation *searchResultTran=[IFTTTTranslationAnimation animationWithView:self.searchResult];
    [self.animator addAnimation:searchResultTran];
    
    [searchResultTran addKeyframeForTime:timeForPage(1) translation:CGPointMake(200, 200)];
    [searchResultTran addKeyframeForTime:timeForPage(2) translation:CGPointZero];
    
}

-(void)setupAnimationPage3{
    //Point3
    IFTTTFrameAnimation *point3Frame=[IFTTTFrameAnimation animationWithView:self.point3];
    IFTTTAlphaAnimation *point3Alpha=[IFTTTAlphaAnimation animationWithView:self.point3];
    [self.animator addAnimation:point3Frame];
    [self.animator addAnimation:point3Alpha];
    
    [point3Frame addKeyframeForTime:timeForPage(2) frame:self.point2.frame];
    [point3Frame addKeyframeForTime:timeForPage(3) frame:self.point3.frame];
    
    [point3Alpha addKeyframeForTime:timeForPage(2) alpha:0.0];
    [point3Alpha addKeyframeForTime:timeForPage(3) alpha:1.0];

}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.animator animate:scrollView.contentOffset.x];
}


@end
