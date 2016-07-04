//
//  ViewController.m
//  CellSizeCacheDemo
//
//  Created by pi on 16/6/25.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"
#import "Joke.h"
#import "ModelSizeCache.h"

NSString *const kCellID = @"Cell";
@interface ViewController ()<CellDelegate>
@property (strong,nonatomic) NSMutableArray *jokes;
@property (strong,nonatomic) ModelSizeCache *modelSizeCache;
@property (strong,nonatomic) Cell  *prototypeCell; //计算行高用的 Cell
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.jokes = [[Joke loadJokeFromPlist]mutableCopy];
}

-(ModelSizeCache *)modelSizeCache{
    if(!_modelSizeCache){
        _modelSizeCache=[ModelSizeCache new];
    }
    return _modelSizeCache;
}

-(Cell *)prototypeCell{
    if(!_prototypeCell){
        _prototypeCell=[self.tableView dequeueReusableCellWithIdentifier:kCellID];
    }
    return _prototypeCell;
}

#pragma mark - 
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Cell *cell= [tableView dequeueReusableCellWithIdentifier:kCellID];
    Joke *joke=self.jokes[indexPath.row];
    [cell configCellWithJoke:joke tableView:tableView];
    cell.delegate=self;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.jokes.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //先从缓存根据 Model 的 hash 值取缓存的行高,如果没有就调用后面的 orCalc Block计算行高,将计算结果存入缓存,然后返回行高.
    return [self.modelSizeCache getHeightForModel:self.jokes[indexPath.row] withTableView:tableView orCalc:^CGFloat(id model, UITableView *tableView) {
        return [self.prototypeCell calcCellHeightWithJoke:self.jokes[indexPath.row] tableView:tableView];
    }];
}

#pragma mark - CellDelegate
-(void)cell:(Cell *)cell didStepperValueChanged:(NSInteger)value{
    NSIndexPath *indexPath= [self.tableView indexPathForCell:cell];
    Joke *joke= self.jokes[indexPath.row];
    joke.repeatCount=value;
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
