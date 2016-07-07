//
//  ModelSizeCache.h
//  PiChat
//
//  Created by pi on 16/4/28.
//  Copyright © 2016年 pi. All rights reserved.
//

@import UIKit;

typedef CGFloat (^CalcModelHeightBlock)(id model,UITableView *tableView);
typedef CGSize (^CalcModelSizeBlock)(id model,UICollectionView *collectionView);

@protocol ModelSizeCacheProtocol <NSObject>

-(NSString*)modelID;

@end

/**
 *  缓存行高的工具类,Model 需实现 UniqueObject protocal ,返回代表这个 model 的唯一 ID
 *  计算一次行高后存入 NSCache 中,model 的 uniqueID 作为 key,cell Size 作为 value.
 */
@interface ModelSizeCache : NSObject

/**
 *  获取或者计算 Model Cell Height
 *
 *  @param model
 *  @param tableView
 *  @param block  如果没有缓存的行高,就执行这个 block 来计算,
 *
 *  @return cell Height
 */
-(CGFloat)getHeightForModel:(id)model withTableView:(UITableView*)tableView orCalc:(CalcModelHeightBlock)block;

/**
 *  获取或者计算 Model Cell Size
 *
 *  @param model
 *  @param collectionView
 *  @param block  如果没有缓存的行高,就执行这个 block 来计算,
 *
 *  @return  cell Size
 */
-(CGSize)getSizeForModel:(id)model withCollectionView:(UICollectionView*)collectionView orCalc:(CalcModelSizeBlock)block;

/**
 *  清除某个 Model 的行高缓存,下次获取时会重新计算
 *
 *  @param models
 */
-(void)invalidateCacheForModel:(id)model;

-(void)invalidateCacheForModels:(NSArray*)models;

-(void)clearCache;
@end
