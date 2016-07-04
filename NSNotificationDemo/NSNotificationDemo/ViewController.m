//
//  ViewController.m
//  NSNotificationDemo
//
//  Created by pi on 16/5/3.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "ViewController.h"
#import "NSNotification+DownloadImage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //老方式
    UIImage *img;
    NSURL *imgUrl;
    NSDictionary *userInfo=@{@"image":img,@"imgUrl":imgUrl};
    [[NSNotificationCenter defaultCenter]postNotificationName:@"NotificationName" object:self userInfo:userInfo];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(handleNotification:) name:@"NotificationName" object:nil];
    
    //新方式
    [NSNotification postDownloadImageNotification:self image:img url:imgUrl];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(handleNotification:) name:kDownloadImageCompleteNotification object:nil];
    
}

-(void)handleNotification:(NSNotification*)noti{
    //
    UIImage *img= noti.userInfo[@"image"];
    NSURL *imgUrl= noti.userInfo[@"imgUrl"];
    
    //新方式
    noti.image;
    noti.imageUrl;
}

@end
