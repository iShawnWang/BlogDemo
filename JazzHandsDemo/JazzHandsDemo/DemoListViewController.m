//
//  DemoListViewController.m
//  JazzHandsDemo
//
//  Created by pi on 16/2/24.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "DemoListViewController.h"
#import "ViewController.h"
#import "TalkIntroDemo.h"
#import "TalkIntroFull.h"
#import "JazzHandsScrollControllerDemo.h"
#import "JazzHandsPageViewControllerDemo.h"
#import "JazzHandsKeepViewDemo.h"
#import "JazzHandsTextMoveViewController.h"
#import "BackgroundColorDemo.h"



@interface DemoListViewController ()
@property (strong,nonatomic) NSArray *demos;
@end

@implementation DemoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.demos=@[@{@"基本":[[ViewController alloc]init]},
                 @{@"TalkIntro 球":[[TalkIntroDemo alloc]init]},
                 @{@"TalkIntro 完整":[[TalkIntroFull alloc]init]},
                 @{@"IFTTTAnimatedScrollViewDemo":[[JazzHandsScrollControllerDemo alloc]init]},
                 @{@"IFTTTAnimatedPagingScrollViewDemo":[[JazzHandsPageViewControllerDemo alloc]init]},
                 @{@"JazzHandsKeepViewDemo":[[JazzHandsKeepViewDemo alloc]init]},
                 @{@"JazzHandsTextMoveViewController":[[JazzHandsTextMoveViewController alloc]init]},
                 @{@"BackgroundColorDemo":[[BackgroundColorDemo alloc]init]},
                 ];
}

#pragma mark - Table

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.demos.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    NSDictionary *dict=self.demos[indexPath.row];
    cell.textLabel.text=dict.allKeys.firstObject;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict=self.demos[indexPath.row];
    [self.navigationController pushViewController:dict.allValues.firstObject animated:YES];
}

@end
