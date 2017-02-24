//
//  ZYPerson2.m
//  ZYRuntime
//
//  Created by Momo on 17/2/24.
//  Copyright © 2017年 Momo. All rights reserved.
//

#import "ZYPerson2.h"
#import <objc/message.h>

@implementation ZYPerson2

// 没有返回值，也没有参数的写法
// void,(id,SEL)
// 没有返回值，有参数的写法
// void (id,SEL,id)
void aaa(id self,SEL _cmd,NSNumber * meter){
    NSLog(@"学习了%@分钟",meter);
}


// resolveInstanceMethod   对象找不到方法时调用
// resolveClassMethod       类找不到方法时调用

// 当没有找到方法的时候 会执行以下方法
// 任何方法默认都有两个隐式参数,self,_cmd
// 什么时候调用:只要一个对象调用了一个未实现的方法就会调用这个方法,进行处理
// 作用:动态添加方法,处理未实现
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    
    if (sel == NSSelectorFromString(@"study:")) {
        // Class : 哪个类
        // SEL : 哪个方法   等会儿用C语言写一个函数
        // IMP : 方法实现 => 函数 => 函数入口 => 函数名
        // type : 方法类型
        // v : void
        // @ : 对象 id
        // : 冒号代表 方法SEL
        class_addMethod(self, sel, (IMP)aaa, "v@:@");
        return YES;
    }
    
    return [super resolveClassMethod:sel];
}

@end
