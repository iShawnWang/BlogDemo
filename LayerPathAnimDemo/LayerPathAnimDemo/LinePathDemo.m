//
//  LinePathDemo.m
//  LayerPathAnimDemo
//
//  Created by pi on 16/2/29.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "LinePathDemo.h"

@interface LinePathDemo ()
@property (strong,nonatomic) CAShapeLayer *layer;
@end

@implementation LinePathDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.layer=[CAShapeLayer layer];
    UIBezierPath *path=[UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(200, 200)];
    path.lineWidth=5;
    self.layer.path=path.CGPath;
    self.layer.strokeColor=[UIColor redColor].CGColor;
    
    [self.view.layer addSublayer:self.layer];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CABasicAnimation *anim=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    anim.fromValue=@0;
    anim.toValue=@1.0;
    anim.duration=2.0;
    [self.layer addAnimation:anim forKey:@"strokeEnd"];
}

@end
