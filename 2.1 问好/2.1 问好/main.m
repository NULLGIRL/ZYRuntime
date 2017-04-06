//
//  main.m
//  2.1 问好
//
//  Created by Momo on 17/4/6.
//  Copyright © 2017年 Momo. All rights reserved.
//

// 动态创建一个类，并创建成员变量和方法，最后赋值成员变量并发送消息。其中成员变量的赋值使用了KVC和object_setIvar函数两种方式，这些东西大家举一反三就可以了。

#import <Foundation/Foundation.h>

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

/*
 在使用
 
 objc_msgSend(peopleInstance, s, @"大家好!");
 默认会出现以下错误：
 objc_msgSend()报错Too many arguments to function call ,expected 0,have3
 直接通过objc_msgSend(self, setter, value)是报错，说参数过多。
 请这样解决：
 Build Setting–> Apple LLVM 7.0 – Preprocessing–> Enable Strict Checking of objc_msgSend Calls 改为 NO
 */

// 自定义一个方法
void sayFunction(id self,SEL _cmd,id some){
    NSNumber * age = object_getIvar(self, class_getInstanceVariable([self class], "age"));
    NSString * name = [self valueForKey:@"name"];
    NSLog(@"%@岁的%@说：%@",age,name,some);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 动态创建对象 创建一个Person类 继承自NSObject类
        Class People = objc_allocateClassPair([NSObject class], "Person", 0);
        
        // 为该类添加NSString * name 成员变量
        class_addIvar(People, "name", sizeof(NSString *), log2(sizeof(NSString *)), @encode(NSString *));
        // 为该类添加int age成员变量
        class_addIvar(People, "age", sizeof(int), sizeof(int), @encode(int));
        
        // 注册方法名为sayFun的方法
        SEL sayFun = sel_registerName("say:");
        // 为该类增加名为sayFun的方法
        class_addMethod(People, sayFun, (IMP)sayFunction, "v@:@");
        
        // 注册该类
        objc_registerClassPair(People);
        
        // 创建一个类的实例
        id peopleInstance = [[People alloc]init];
        
        // KVC 动态改变 对象peopleInstance 中的实例变量
        [peopleInstance setValue:@"ZY" forKey:@"name"];
        
        // 从类中获取成员变量Ivar
        Ivar ageIvar = class_getInstanceVariable(People, "age");
        // 为peopleInstance的成员变量赋值
        object_setIvar(peopleInstance, ageIvar, @18);
        
        // 调用 peopleInstance 对象中的 sayFun 方法选择器对应的方法
        //objc_msgSend(peopleInstance, sayFun,@"Hello"); //这样写也可以
        ((void (*) (id,SEL,id))objc_msgSend)(peopleInstance,sayFun,@"Hello");
        //当People类或者它的子类的实例还存在，则不能调用objc_disposeClassPair这个方法；因此这里要先销毁实例对象后才能销毁类；
        peopleInstance = nil;
        
        
        // 销毁类
        objc_disposeClassPair(People);
        
        
    }
    return 0;
}
