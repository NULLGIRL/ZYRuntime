//
//  People+Associated.m
//  2.3 增加新技能
//
//  Created by Momo on 17/4/6.
//  Copyright © 2017年 Momo. All rights reserved.
//

#import "People+Associated.h"

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

@implementation People (Associated)

- (void)setNum:(NSNumber *)num{
    // 设置关联对象
    objc_setAssociatedObject(self, @selector(num), num, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSNumber *)num{
    // 得到关联对象
    return objc_getAssociatedObject(self, @selector(num));
}

- (void)setNumCallBack:(CodingCallBack)numCallBack{
    objc_setAssociatedObject(self, @selector(numCallBack), numCallBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CodingCallBack)numCallBack{
    return objc_getAssociatedObject(self, @selector(numCallBack));
}

@end
