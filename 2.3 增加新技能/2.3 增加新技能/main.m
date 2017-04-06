//
//  main.m
//  2.3 增加新技能
//
//  Created by Momo on 17/4/6.
//  Copyright © 2017年 Momo. All rights reserved.
//
// 在分类中添加属性

#import <Foundation/Foundation.h>

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

#import "People.h"
#import "People+Associated.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        People * p = [[People alloc] init];
        
        p.num = @(18800000000);
        p.numCallBack = ^(){
            NSLog(@"ZY");
        };
        p.numCallBack();
        
    }
    return 0;
}
