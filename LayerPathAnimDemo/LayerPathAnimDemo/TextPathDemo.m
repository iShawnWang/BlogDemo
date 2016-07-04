//
//  TextPathDemo.m
//  LayerPathAnimDemo
//
//  Created by pi on 16/2/29.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "TextPathDemo.h"
#import "TextPathHelper.h"

@interface TextPathDemo ()
@property (strong,nonatomic) CAShapeLayer *textLayer;
@property (strong,nonatomic) CALayer *penLayer;
@end

@implementation TextPathDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textLayer= [TextPathHelper textLayerWithText:@"Swift" frame:self.view.bounds];
    [self.view.layer addSublayer: self.textLayer];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIImage *penImg=[UIImage imageNamed:@"pen"];
    
    self.penLayer=[CALayer layer];
    self.penLayer.contents=(id)penImg.CGImage;
    self.penLayer.anchorPoint=CGPointZero;
    self.penLayer.bounds=CGRectMake(0, 0, penImg.size.width, penImg.size.height);
    [self.textLayer addSublayer:self.penLayer];
    
    
    CAKeyframeAnimation *penAnim=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    penAnim.path=self.textLayer.path;
    penAnim.duration=8.0;
    penAnim.calculationMode=kCAAnimationPaced;
    penAnim.delegate=self;
    
    [self.penLayer addAnimation:penAnim forKey:@"penAnim"];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self.penLayer removeFromSuperlayer];
}

@end
