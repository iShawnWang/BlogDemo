//
//  ModelSizeCache.m
//  PiChat
//
//  Created by pi on 16/4/28.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "ModelSizeCache.h"

const CGSize NilCacheSize ={-1,-1};

@interface ModelSizeCache ()
@property (strong,nonatomic) NSCache *cacheLandscape;
@property (strong,nonatomic) NSCache *cachePortrait;
@end

@implementation ModelSizeCache

-(NSCache *)cachePortrait{
    if(!_cachePortrait){
        _cachePortrait=[NSCache new];
    }
    return _cachePortrait;
}

-(NSCache *)cacheLandscape{
    if(!_cacheLandscape){
        _cacheLandscape=[NSCache new];
    }
    return _cacheLandscape;
}

-(void)setOrientationSize:(CGSize)size forModel:(id<ModelSizeCacheProtocol>)model{
    if(UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)){
        [self.cacheLandscape setObject:[NSValue valueWithCGSize:size] forKey:[model modelID]];
    }else{
        [self.cachePortrait setObject:[NSValue valueWithCGSize:size] forKey:[model modelID]];
    }
}

-(NSValue*)sizeByOrientationForKey:(NSString*)key{
    if(UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)){
        return [self.cacheLandscape objectForKey:key];
    }else{
        return [self.cachePortrait objectForKey:key];
    }
}

-(CGSize)getSizeForModel:(id<ModelSizeCacheProtocol>)model withCollectionView:(UICollectionView *)collectionView orCalc:(CalcModelSizeBlock)block{
    //先从缓存中取
    CGSize modelSize= [self getCacheSizeForModel:model];
    //没有就计算一下
    if( CGSizeEqualToSize(modelSize, NilCacheSize)){
        modelSize= block(model,collectionView);
        
        //计算完成存入缓存中
        [self setOrientationSize:modelSize forModel:model];
        NSLog(@"计算行高 :%@",NSStringFromCGSize(modelSize));
    }
    return modelSize;
}

-(CGFloat)getHeightForModel:(id<ModelSizeCacheProtocol>)model withTableView:(UITableView *)tableView orCalc:(CalcModelHeightBlock)block{
    //先从缓存中取
    CGSize modelSize= [self getCacheSizeForModel:model];
    //没有就计算一下
    if( CGSizeEqualToSize(modelSize, NilCacheSize)){
        modelSize.height= block(model,tableView);
        
        //计算完成存入缓存中
        [self setOrientationSize:modelSize forModel:model];
        NSLog(@"计算行高 :%@",@(modelSize.height));
    }
    return modelSize.height;
}

-(CGSize)getCacheSizeForModel:(id<ModelSizeCacheProtocol>)model{
    CGSize cacheSize=NilCacheSize;
    //从缓存中读取 size
    NSValue *cacheSizeValue=[self sizeByOrientationForKey:[model modelID]];
    if(cacheSizeValue){
        NSLog(@"从缓存中读取行高 :%@",cacheSizeValue);
        cacheSize= cacheSizeValue.CGSizeValue;
    }
    return cacheSize;
}

-(void)invalidateCacheForModels:(NSArray*)models{
    [models enumerateObjectsUsingBlock:^(id<ModelSizeCacheProtocol>  _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
        [self invalidateCacheForModel:model];
    }];
}

-(void)invalidateCacheForModel:(id<ModelSizeCacheProtocol>)model{
    [self.cachePortrait removeObjectForKey:[model modelID]];
    [self.cacheLandscape removeObjectForKey:[model modelID]];
}

-(void)clearCache{
    [self.cachePortrait removeAllObjects];
    [self.cacheLandscape removeAllObjects];
}
@end
