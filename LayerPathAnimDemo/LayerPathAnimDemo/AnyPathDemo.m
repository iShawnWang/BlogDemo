//
//  AnyPathDemo.m
//  LayerPathAnimDemo
//
//  Created by pi on 16/2/29.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "AnyPathDemo.h"

@interface AnyPathDemo ()
@property (strong,nonatomic) CAShapeLayer *layer;
@property (strong,nonatomic) CALayer *planeLayer;
@end

@implementation AnyPathDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.layer=[CAShapeLayer layer];
    
    UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 100, 300, 300)];
    self.layer.path=path.CGPath;
    self.layer.lineWidth=5;
    self.layer.strokeColor=[UIColor redColor].CGColor;
    self.layer.fillColor=[UIColor clearColor].CGColor;
    [self.view.layer addSublayer:self.layer];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CABasicAnimation *strokeAnim=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeAnim.fromValue=@0;
    strokeAnim.toValue=@1.0;
    strokeAnim.duration=2.0;
    [self.layer addAnimation:strokeAnim forKey:@"strokeEnd"];
    
    self.planeLayer=[CALayer layer];
    UIImage *planeImg=[UIImage imageNamed:@"Airplane"];
    self.planeLayer.contents=(id)planeImg.CGImage;
    
    self.planeLayer.bounds=CGRectMake(0, 0, 20*3.15, 20);
    [self.view.layer addSublayer:self.planeLayer];
    
    //
    CAKeyframeAnimation *positionAnim=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnim.path=self.layer.path;
    positionAnim.duration=2.0;
    positionAnim.calculationMode=kCAAnimationPaced;
    positionAnim.rotationMode=kCAAnimationRotateAuto;
    
    [self.planeLayer addAnimation:positionAnim forKey:@"position"];
    
}

@end
