//
//  JazzHandsTextMoveViewController.m
//  JazzHandsDemo
//
//  Created by pi on 16/2/25.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "JazzHandsTextMoveViewController.h"
#import <Masonry.h>
#import "UIView+PiAdditions.h"

@interface JazzHandsTextMoveViewController ()
@property (strong,nonatomic) UIImageView *jazz;
@end

@implementation JazzHandsTextMoveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.scrollView.backgroundColor=[UIColor orangeColor];
    self.scrollView.showsHorizontalScrollIndicator=YES;
    
    self.jazz=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Jazz"]];
    [self.contentView addSubview: self.jazz]; //注意添加 view 到 contentView 上
    
    [self.jazz mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.scrollView).multipliedBy(0.5); //宽度约束 想好和 scrollView 还是 contentView 相等
        make.height.equalTo(self.jazz.mas_width).multipliedBy(0.3);
    }];
    
    NSLayoutConstraint *jazzYConstraint=[NSLayoutConstraint constraintWithItem:self.jazz attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0];
    //约束 jazz Y 方向位置
    jazzYConstraint.active=YES;
    
    [self keepView:self.jazz onPage:0];
    
//    [self setupConstraintAnim:jazzYConstraint]; //Constraint 平移动画
    [self setupTransformAnim];      //transform 平移动画
    
}

-(void)setupConstraintAnim:(NSLayoutConstraint*)jazzYConstraint{
    IFTTTConstraintMultiplierAnimation *jazzYAnim=[IFTTTConstraintMultiplierAnimation animationWithSuperview:self.jazz.superview constraint:jazzYConstraint attribute:IFTTTLayoutAttributeHeight referenceView:self.scrollView]; //注意 Attribute 和 referenceView 的选择, referenceView 也可以选择页面中的任意 View
    //构建 Jazz Y 方向动画
    
    [jazzYAnim addKeyframeForTime:0 multiplier:0];
    [jazzYAnim addKeyframeForTime:1 multiplier:-0.3];
    [self.animator addAnimation:jazzYAnim];
}

-(void)setupTransformAnim{
    IFTTTTranslationAnimation *jazzTran=[IFTTTTranslationAnimation animationWithView:self.jazz];
    [jazzTran addKeyframeForTime:0 translation:CGPointMake(0, 0)];
    [jazzTran addKeyframeForTime:1 translation:CGPointMake(0, -self.scrollView.height*0.3)];
    
    [self.animator addAnimation:jazzTran];
}

@end
