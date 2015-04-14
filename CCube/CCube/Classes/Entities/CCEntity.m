//
//  CCEntity.m
//  CCube
//
//  Created by Cc on 15/4/14.
//  Copyright (c) 2015年 PinguoSDK. All rights reserved.
//

#import "CCEntity.h"
#import <objc/runtime.h>

#define SelfClass CCEntity

@implementation CCEntity

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone
{
    SelfClass *newEntity = [[[self class] allocWithZone:zone] init];
    [self copyEntity:newEntity inClass:[self class]];
    return newEntity;
}

- (void)copyEntity:(SelfClass*)entity inClass:(Class)classType
{
    Class superClass = class_getSuperclass(classType);
    if (superClass != nil && ![superClass isEqual:[SelfClass class]])
    {
        [self copyEntity:entity inClass:superClass];
    }
    
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList([classType class], &outCount);
    for (int i = 0; i < outCount; i++)
    {
        objc_property_t property = properties[i];
        //obj.json_oid
        NSString *strPropertyName = [[NSString alloc] initWithCString:property_getName(property)
                                                             encoding:NSUTF8StringEncoding];
        if ([self fIsFormatWith_mJson:strPropertyName])
        {
            //obj._json_oid
            NSString *strPropertyPrivateName = [@"_" stringByAppendingString:strPropertyName];
            id selfValue = [self valueForKey:strPropertyName];
            id copyValue = nil;
            if ([selfValue isKindOfClass:[NSArray class]]) {
                // NSArray
                copyValue = [[NSMutableArray alloc] initWithArray:selfValue copyItems:YES];
            }
            else if ([selfValue isKindOfClass:[NSDictionary class]]) {
                // NSDictionary
                copyValue = [[NSMutableDictionary alloc] initWithDictionary:selfValue copyItems:YES];
            }
            else {
                // NSString NSNumber NSObject or nil
                copyValue = [selfValue copy];
            }
            [entity setValue:copyValue forKey:strPropertyPrivateName];
        }
        else if ([self fIsWeakProperty:strPropertyName]) {
            
            id selfValue = [self valueForKey:strPropertyName];
            [entity setValue:selfValue forKey:strPropertyName];
        }
        else {
            
            NSLog(@"Error：没有copy 这种属性 = %@",strPropertyName);
        }
    }
    free(properties);
}

- (BOOL)fIsFormatWith_mJson:(NSString *)strPropertyName
{
    return ([strPropertyName hasPrefix:@"mStr"] ||
            [strPropertyName hasPrefix:@"mNmb"] ||
            [strPropertyName hasPrefix:@"mArr"] ||
            [strPropertyName hasPrefix:@"mDic"] ||
            [strPropertyName hasPrefix:@"mEty"] ||
            [strPropertyName hasPrefix:@"mEum"] ||
            [strPropertyName hasPrefix:@"mBol"] ||
            [strPropertyName hasPrefix:@"mPot"] ||
            [strPropertyName hasPrefix:@"mRct"] ||
            [strPropertyName hasPrefix:@"mFlt"] ||
            [strPropertyName hasPrefix:@"mTfm"] ||
            [strPropertyName hasPrefix:@"mInt"] ||
            [strPropertyName hasPrefix:@"mDta"] ||
            [strPropertyName hasPrefix:@"mUrl"]);
    //    return YES;
}

- (BOOL)fIsWeakProperty:(NSString *)strPropertyName
{
    return (
            [strPropertyName hasPrefix:@"mWeak"]
            );
}

@end
