//
//  NSObject+ZYProperty.m
//  ZYRuntime
//
//  Created by Momo on 17/2/24.
//  Copyright © 2017年 Momo. All rights reserved.
//

#import "NSObject+ZYProperty.h"
#import <objc/message.h>

@implementation NSObject (ZYProperty)

- (void)setName:(NSString *)name{
    
    // 让这个字符串与当前对象产生联系
    
    // object : 给哪个对象添加属性
    // key :    属性名称
    // value :  属性值
    // policy : 保存策略
    /*
     typedef OBJC_ENUM(uintptr_t, objc_AssociationPolicy) {
        OBJC_ASSOCIATION_ASSIGN = 0,
        OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1,
        OBJC_ASSOCIATION_COPY_NONATOMIC = 3,
        OBJC_ASSOCIATION_RETAIN = 01401,
        OBJC_ASSOCIATION_COPY = 01403
     };
     */
    
    // 此处写 @"name" 和 "name" 效果等同
//    objc_setAssociatedObject(self, "name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (NSString *)name{
//    return objc_getAssociatedObject(self, "name");
    return objc_getAssociatedObject(self, @"name");
}

@end
