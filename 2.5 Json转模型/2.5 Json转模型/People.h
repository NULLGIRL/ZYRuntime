//
//  People.h
//  2.5 Json转模型
//
//  Created by Momo on 17/4/6.
//  Copyright © 2017年 Momo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject

@property (nonatomic, copy) NSString *name; // 姓名
@property (nonatomic, strong) NSNumber *age; // 年龄

// 生成model
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

// 转换成字典
- (NSDictionary *)covertToDictionary;

@end
