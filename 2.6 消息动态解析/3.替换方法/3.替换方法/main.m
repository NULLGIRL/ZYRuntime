//
//  main.m
//  3.替换方法
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
        
        People * p = [[People alloc] init];
        ((void(*)(id,SEL)) objc_msgSend)((id)p, @selector(sing));
    }
    return 0;
}
