//
//  ZYImage.m
//  ZYRuntime
//
//  Created by Momo on 17/2/24.
//  Copyright © 2017年 Momo. All rights reserved.
//

#import "ZYImage.h"

@implementation ZYImage

// 重写方法:想给系统的方法添加额外功能
+ (UIImage *) imageName:(NSString *)name{
    // 真正加载图片
    UIImage *image = [super imageNamed:name];
    
    if (image) {
        NSLog(@"加载成功");
    } else {
        NSLog(@"加载失败");
    }
    
    return image;
}

@end
