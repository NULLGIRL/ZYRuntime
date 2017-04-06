//
//  NSObject+ZYProperty.h
//  ZYRuntime
//
//  Created by Momo on 17/2/24.
//  Copyright © 2017年 Momo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ZYProperty)

// @property在分类中 ： 只会生成get和set方法声明，不会生成实现，也不会生成下划线成员属性
@property NSString * name;

@end
