//
//  Cell.m
//  CellSizeCacheDemo
//
//  Created by pi on 16/6/25.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "Cell.h"
#import "Joke.h"

@implementation Cell

-(void)configCellWithJoke:(Joke*)joke tableView:(UITableView*)tableView{
    self.bounds=CGRectMake(0, 0, CGRectGetWidth(tableView.bounds), CGRectGetHeight(self.bounds));
    self.demoLabel.text=[joke.content stringByPaddingToLength:joke.repeatCount * joke.content.length withString:joke.content startingAtIndex:0];
    self.demoImageView.image=[UIImage imageNamed:joke.imageName];
    self.demoStepper.value=joke.repeatCount;
    [self updateConstraintsIfNeeded];
}

-(CGFloat)calcCellHeightWithJoke:(Joke *)joke tableView:(UITableView *)tableView{
    [self configCellWithJoke:joke tableView:tableView];
    self.demoLabel.preferredMaxLayoutWidth= CGRectGetWidth(tableView.bounds)-75-8-8-8;
    CGSize cellSize= [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return cellSize.height+1.0f;
}

- (IBAction)stepperValueChanged:(UIStepper*)sender {
    [self.delegate cell:self didStepperValueChanged:sender.value];
}

@end
