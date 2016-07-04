//
//  NSNotification+UploadMedia.m
//
//  Created by pi on 16/3/14.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "NSNotification+UploadMedia.h"
#import "NSNotification+Post.h"

#pragma mark - 上传媒体文件通知
NSString *const kUploadMediaNotification=@"kUploadMediaNotification";

static NSString *const kUploadState=@"kUploadState";
static NSString *const kUploadedMediaType=@"kUploadedMediaType";

static NSString *const kUploadedFile=@"kUploadedFile";
static NSString *const kUploadingProgress=@"kUploadingProgress";
static NSString *const kUploadingError=@"kUploadingError";

@implementation NSNotification (UploadMedia)

#pragma mark - Public

+(void)postUploadMediaProgressNotification:(id)object percentDone:(NSInteger)percentDone{
    NSNotification *noti= [NSNotification notificationWithName:kUploadMediaNotification object:object userInfo:@{kUploadState:@(UploadStateProgress),kUploadingProgress:@(percentDone/100.0)}];
    [noti post];
}

+(void)postUploadMediaCompleteNotification:(id)object media:(AVFile*)media type:(UploadedMediaType)mediaType{
    NSNotification *noti= [NSNotification notificationWithName:kUploadMediaNotification object:object userInfo:@{kUploadState:@(UploadStateComplete),kUploadedFile:media,kUploadedMediaType:@(mediaType)}];
    [noti post];
}

+(void)postUploadMediaFailedNotification:(id)object error:(NSError *)error{
    NSNotification *noti= [NSNotification notificationWithName:kUploadMediaNotification object:object userInfo:@{kUploadState:@(UploadStateFailed),kUploadingError:error}];
    [noti post];
}

#pragma mark - Getter
-(UploadState)uploadState{
    return [self.userInfo[kUploadState]integerValue];
}

-(AVFile *)uploadedFile{
    return self.userInfo[kUploadedFile];
}

-(float)progress{
    return [self.userInfo[kUploadingProgress] floatValue];
}

-(UploadedMediaType)mediaType{
    return [self.userInfo[kUploadedMediaType] integerValue];
}

-(NSError *)error{
    return self.userInfo[kUploadingError];
}
@end
