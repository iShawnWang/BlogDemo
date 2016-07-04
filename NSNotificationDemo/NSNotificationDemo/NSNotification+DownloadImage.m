//
//  NSNotification+DownloadImage.m
//
//  Created by pi on 16/3/14.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "NSNotification+DownloadImage.h"
#import "NSNotification+Post.h"

NSString *const kDownloadImageCompleteNotification=@"kDownloadImageCompleteNotification";

static NSString *const kDownloadedImage=@"kDownloadedImage";
static NSString *const kDownloadedImageUrl=@"kDownloadedImageUrl";

@implementation NSNotification (DownloadImage)

+(void)postDownloadImageNotification:(id)object image:(UIImage*)img url:(NSURL*)imageUrl{
    [[NSNotification notificationWithName:kDownloadImageCompleteNotification object:object userInfo:@{kDownloadedImage:img,kDownloadedImageUrl:imageUrl}]post];
}

-(UIImage *)image{
    return self.userInfo[kDownloadedImage];
}

-(NSURL *)imageUrl{
    return self.userInfo[kDownloadedImageUrl];
}
@end
