//
//  ViewController.m
//  ParseHtmlDemo
//
//  Created by pi on 16/4/12.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "ViewController.h"
#import "Post.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Post getNewPosts];
}

@end
