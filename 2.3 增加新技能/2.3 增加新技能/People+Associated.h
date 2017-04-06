//
//  People+Associated.h
//  2.3 增加新技能
//
//  Created by Momo on 17/4/6.
//  Copyright © 2017年 Momo. All rights reserved.
//

#import "People.h"


typedef void (^CodingCallBack)();
@interface People (Associated)

@property (nonatomic,strong) NSNumber * num;
@property (nonatomic, copy) CodingCallBack numCallBack; // 写代码


@end
