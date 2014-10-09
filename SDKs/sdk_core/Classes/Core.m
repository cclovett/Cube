//
//  Core.m
//  sdk_core
//
//  Created by Cc on 14-10-9.
//  Copyright (c) 2014年 PinguoSDK. All rights reserved.
//

#import "Core.h"
//#import <RsCoreDataManager.h>
#import <sdk_resource/RsCoreDataManager.h>

@implementation Core

- (instancetype)init
{
    self = [super init];
    if (self) {
        id ss = [RsCoreDataManager newContext];
        ss = nil;
    }
    return self;
}

@end
