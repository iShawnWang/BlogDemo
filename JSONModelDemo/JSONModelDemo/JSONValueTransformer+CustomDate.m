//
//  JSONValueTransformer+CustomDate.m
//  JSONModelDemo
//
//  Created by pi on 16/3/1.
//  Copyright © 2016年 pi. All rights reserved.
//

#import "JSONValueTransformer+CustomDate.h"

NSString *const APIDateFormat=@"yyyyMMdd";

@implementation JSONValueTransformer (CustomDate)
-(NSDate *)NSDateFromNSString:(NSString *)string{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:APIDateFormat];
    return [formatter dateFromString:string];
}

-(NSString *)JSONObjectFromNSDate:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:APIDateFormat];
    return [formatter stringFromDate:date];
}
@end
