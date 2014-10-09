//
//  RsCoreDataManager.m
//  sdk_resource
//
//  Created by Cc on 14-10-9.
//  Copyright (c) 2014年 PinguoSDK. All rights reserved.
//

#import "RsCoreDataManager.h"

@implementation RsCoreDataManager

+ (id)newContext
{
    return [self instance];
}

+ (instancetype)instance
{
    static RsCoreDataManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[RsCoreDataManager alloc] init];
    });
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *sss = @"123";
        NSLog(@"%@",sss);
    }
    return self;
}

@end
