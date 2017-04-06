//
//  People.m
//  3.替换方法
//
//  Created by Momo on 17/4/6.
//  Copyright © 2017年 Momo. All rights reserved.
//

#import "People.h"

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

@implementation People

// 第一步： 我们不动态添加方法，返回NO，进入第二步
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    return NO;
}

// 第二步： 我们不指定备选对象响应aSelector，进入第三步；
- (id)forwardingTargetForSelector:(SEL)aSelector{
    return nil;
}

// 第三步：返回方法选择器，进入第四步；
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    if ([NSStringFromSelector(aSelector) isEqualToString:@"sing"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

// 第四步：这步我们修改调用方法
- (void)forwardInvocation:(NSInvocation *)anInvocation{
    [anInvocation setSelector:@selector(dance)];
    //这里还要指定是哪个对象的方法
    [anInvocation invokeWithTarget:self];
}

// 若forwardInvocation没有实现，则会调用此方法
- (void)doesNotRecognizeSelector:(SEL)aSelector{
    
    NSLog(@"消息无法处理：%@",NSStringFromSelector(aSelector));
}

- (void) dance{
    NSLog(@"跳舞");
}

@end
