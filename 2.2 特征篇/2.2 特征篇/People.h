//
//  People.h
//  2.2 特征篇
//
//  Created by Momo on 17/4/6.
//  Copyright © 2017年 Momo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject
{
    NSString * _occupation; // 职业
    NSString * _nationality; // 国籍
}

@property (nonatomic,copy) NSString * name;
@property (nonatomic) NSUInteger age;

/** 获取所有属性*/
- (NSDictionary *) allProperties;
/** 获取所有变量*/
- (NSDictionary *) allIvars;
/** 获取所有方法*/
- (NSDictionary *) allMethods;

@end
