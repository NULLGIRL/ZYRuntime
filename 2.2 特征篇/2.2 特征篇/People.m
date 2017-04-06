//
//  People.m
//  2.2 特征篇
//
//  Created by Momo on 17/4/6.
//  Copyright © 2017年 Momo. All rights reserved.
//

#import "People.h"

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

@implementation People

- (NSDictionary *)allProperties{
    unsigned int count = 0;
    
    // 获取类的所有属性，如果没有属性count就为0
    objc_property_t * properties = class_copyPropertyList([self class], &count);
    NSMutableDictionary * resultDict = [@{} mutableCopy];
    
    for (NSUInteger i = 0; i < count; i ++) {
        
        // 获取属性的名称和值
        const char * propertyName = property_getName(properties[i]);
        NSString * name = [NSString stringWithUTF8String:propertyName];
        id propertyValue = [self valueForKey:name];
        
        if (propertyValue) {
            resultDict[name] = propertyValue;
        }
        else{
            resultDict[name] = @"字典的key对应的value不能为nil！";
        }
    }
    
    // 这里properties是一个数组指针，我们需要使用free函数来释放内存
    free(properties);
    
    return  resultDict;
}

- (NSDictionary *)allIvars{
    unsigned int count = 0;
    
    NSMutableDictionary * resultDic = [@{} mutableCopy];
    
    Ivar * ivars = class_copyIvarList([self class], &count);
    
    for (NSUInteger i = 0; i < count; i ++) {
        
        const char * varName = ivar_getName(ivars[i]);
        NSString * name = [NSString stringWithUTF8String:varName];
        id varValue = [self valueForKey:name];
        
        if (varName) {
            resultDic[name] = varValue;
        }
        else{
            resultDic[name] = @"字典的key对应的value不能为nil！";
        }
    }
    
    free(ivars);
    
    return resultDic;
}

- (NSDictionary *)allMethods{
    
    unsigned int count = 0;
    NSMutableDictionary * resultDic = [@{} mutableCopy];
    
    Method * methods = class_copyMethodList([self class], &count);
    
    for (NSUInteger i = 0; i < count; i ++) {
        
        SEL methodSEL = method_getName(methods[i]);
        const char * methodName = sel_getName(methodSEL);
        NSString * name = [NSString stringWithUTF8String:methodName];
        
        // 获取方法的参数列表
        int arguments = method_getNumberOfArguments(methods[i]);
        
        resultDic[name] = @(arguments - 2);
    }
    
    free(methods);
    
    return resultDic;
    
}

@end
