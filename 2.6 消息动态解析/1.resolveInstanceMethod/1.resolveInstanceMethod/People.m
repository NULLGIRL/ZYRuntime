//
//  People.m
//  1.resolveInstanceMethod
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

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    
    // 我们没有给People类实现sing方法 我们就在这里动态添加方法
    if ([NSStringFromSelector(sel) isEqualToString:@"sing"]) {
        class_addMethod(self, sel, (IMP)otherSing, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

void otherSing(id self, SEL cmd){
    
    NSLog(@"%@ Sing",((People *)self).name);
}

@end
