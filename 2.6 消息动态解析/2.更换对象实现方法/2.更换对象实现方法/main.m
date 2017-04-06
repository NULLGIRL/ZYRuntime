//
//  main.m
//  2.更换对象实现方法
//
//  Created by Momo on 17/4/6.
//  Copyright © 2017年 Momo. All rights reserved.
//
/**
 外面的小鸟在唱歌，但是p的歌声盖过了小鸟，我们只能听到p唱歌了。
 这里我们不声明sing方法，将调用途中动态更换调用对象。
 在第一首代码的基础上，创建Bird的model
 */
#import <Foundation/Foundation.h>

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

#import "People.h"
#import "Bird.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Bird * bird = [[Bird alloc] init];
        bird.name = @"小鸟";
        ((void (*) (id,SEL)) objc_msgSend)((id)bird,@selector(sing));
    }
    return 0;
}
