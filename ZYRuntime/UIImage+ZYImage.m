//
//  UIImage+ZYImage.m
//  ZYRuntime
//
//  Created by Momo on 17/2/24.
//  Copyright © 2017年 Momo. All rights reserved.
//

#import "UIImage+ZYImage.h"
#import <objc/message.h>

@implementation UIImage (ZYImage)
// 把类加载到内存的时候调用，并且只会调用一次
+ (void) load{
    // self -> UIImage
    // 获取imageName
    // 获取哪个类的方法
    // SEL :获取哪个方法
    Method imageNameMethod = class_getClassMethod(self, @selector(imageNamed:));
    // 获取zy_imageNamed
    Method zy_imageNameMethod = class_getClassMethod(self, @selector(zy_imageNamed:));
    
    //交换方法:runtime
    method_exchangeImplementations(imageNameMethod, zy_imageNameMethod);
    // 调用imageNamed => zy_imageNamed
    // 调用zy_imageNamed => imageNamed
}

// initialize 会调用多次
//+ (void)initialize{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        
//    });
//}


+ (UIImage *)zy_imageNamed:(NSString *)name{
    
    // 图片
    
    // 此步骤非常关键！！！！！
    // 调用zy_imageName 时 换成UIImage的imagename系统方法
    // 调用系统的imageName方法 调换成zy_imageName并进来实现，再次将zy_imageName换成UIIamge的imageName方法
    UIImage *image = [UIImage zy_imageNamed:name];
    
    // 如果用了以下步骤 则会变成循环引用 内存受不了 程序奔溃
//    UIImage *image = [UIImage imageNamed:name];
    
    
    if (image) {
        NSLog(@"加载成功");
    } else {
        NSLog(@"加载失败");
    }
    
    return image;
}

@end
