//
//  main.m
//  1.resolveInstanceMethod
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
        
        People *cangTeacher = [[People alloc] init];
        cangTeacher.name = @"ZY";
        [cangTeacher sing];
    }
    return 0;
}
