//
//  Cell.h
//  CellSizeCacheDemo
//
//  Created by pi on 16/6/25.
//  Copyright © 2016年 pi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Cell;
@class Joke;
@protocol CellDelegate <NSObject>

-(void)cell:(Cell*)cell didStepperValueChanged:(NSInteger)value;

@end

@interface Cell : UITableViewCell
@property(nonatomic,weak) IBOutlet id<CellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIImageView *demoImageView;
@property (weak, nonatomic) IBOutlet UILabel *demoLabel;
@property (weak, nonatomic) IBOutlet UIStepper *demoStepper;
-(void)configCellWithJoke:(Joke*)joke tableView:(UITableView*)tableView;
-(CGFloat)calcCellHeightWithJoke:(Joke*)joke tableView:(UITableView*)tableView;
@end
