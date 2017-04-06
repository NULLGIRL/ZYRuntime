//
//  main.m
//  2.4 资料归档
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
        
        People *p = [[People alloc] init];
        p.name = @"ZY";
        p.age = @18;
        
        NSString * path = NSHomeDirectory();
        path = [NSString stringWithFormat:@"%@/ZY",path];
        //归档
        [NSKeyedArchiver archiveRootObject:p toFile:path];
        //解归档
        People * p2 = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        NSLog(@"%@ - %@",p2.name,p2.age);
    }
    return 0;
}
