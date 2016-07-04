//
//  DemoListController.m
//  LayerPathAnimDemo
//
//  Created by pi on 16/2/29.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "DemoListController.h"
#import <objc/runtime.h>

@interface DemoListController ()
@property (strong,nonatomic) NSMutableArray *demos;
@end

@implementation DemoListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.demos=[NSMutableArray array];
    [self.demos addObjectsFromArray:@[@{@"Line":@"LinePathDemo"},
                                      @{@"Circle":@"AnyPathDemo"},
                                      @{@"Text":@"TextPathDemo"}
                                      ]];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.demos.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    NSDictionary *dict=self.demos[indexPath.row];
    
    cell.textLabel.text=dict.allKeys[0];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict=self.demos[indexPath.row];
    NSString *classStr=dict.allValues[0];
    const char *className=[classStr cStringUsingEncoding:NSASCIIStringEncoding];
    Class newClass= objc_getClass(className);
    if(!newClass){
        Class superClass=[NSObject class];
        
        newClass=objc_allocateClassPair(superClass, className, 0);
        objc_registerClassPair(newClass);
    }
    
    UIViewController *vc=[[newClass alloc]init];
    vc.view.backgroundColor=[UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
