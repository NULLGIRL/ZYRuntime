//
//  main.m
//  2.5 Json转模型
//
//  Created by Momo on 17/4/6.
//  Copyright © 2017年 Momo. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

#import "People.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDictionary *dict = @{
                               @"name" : @"ZY",
                               @"age"  : @18,
            
                               };
        
        // 字典转模型
        People * p = [[People alloc] initWithDictionary:dict];
        NSLog(@"%@ - %@",p.name,p.age);
        
        // 模型转字典
        NSDictionary * covertedDict = [p covertToDictionary];
        NSLog(@"字典：%@",covertedDict);
    }
    return 0;
}
