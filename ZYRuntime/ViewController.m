//
//  ViewController.m
//  ZYRuntime
//
//  Created by Momo on 17/2/24.
//  Copyright © 2017年 Momo. All rights reserved.
//

#import "ViewController.h"

#import <objc/message.h>

// 消息机制
#import "ZYPerson.h"

// 交换方法
#import "ZYImage.h"
#import "UIImage+ZYImage.h"

//动态添加方法
#import "ZYPerson2.h"

/*
 
    runtime:必须要导入头文件 <objc/message.h>
    任何方法调用本质：发送一个消息，用runtime发送消息，OC底层实现通过runtime实现
    
    验证： 方法调用，是否真的转换为消息机制
 
    runtime都有一个前缀，谁的事情使用谁
 
    使用场景：
    不得不用runtime消息机制，可以帮助调用私有方法
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1. 消息机制
    objc_msgSend(self, @selector(message));
    
    // 2. 交换方法
    objc_msgSend(self, @selector(exchangeMethod));
    
    // 3. 动态添加方法
    objc_msgSend(self, @selector(performResolveMethod));
    
}


#pragma mark - 消息机制
- (void) message {
    
    /*
     
     类方法本质： 类对象调用[NSObject class]
     id : 谁发送消息
     SEL : 发送什么消息
     ((NSObject *(*)(id, SEL))(void *)objc_msgSend)([NSObject class], @selector(alloc));
     
     
     解决消息机制方法提示步骤
     查找build setting -> 搜索msg
     最终生成消息机制,编译器做的事情
     最终代码,需要把当前代码重新编译,用xcode编译器,clang
     clang -rewrite-objc main.m 查看最终生成代码
     */
    
    /*
     
     内存五大区：
     1.栈 2.堆 3.静态区 4.常量区 5.方法区
     栈： 不需要手动管理内存，自动管理
     堆： 需要手动管理内存，自己去释放
     */
    

    
    
    //    ZYPerson * p = [ZYPerson alloc];
    // 不可以有@
    ZYPerson * p = objc_msgSend(objc_getClass("ZYPerson"), sel_registerName("alloc"));
    
    //    p = [p init];
    p = objc_msgSend(p, sel_registerName("init"));
    
    // 调用speak方法
    // 头文件没有公开方法 不能调用
    //    [p speak];
    
    // 用runtime方式调用方法
    // 方式1 （即使头文件没有公开方法 也可以调用 不报错无警告）
    objc_msgSend(p, sel_registerName("speak"));
    // 方式2 （即使头文件没有公开方法 也可以调用 不报错但又警告）
    // 方式2 更符合OC的写法
    objc_msgSend(p, @selector(speak));
    
    
    
    /*
     调用speak方法的流程
     每个对象都有一个isa地址
     1.通过isa去对应的类中查找
     2.注册方法编号
     3.根据方法编号去查找对应的方法（地址）
     4.找到函数实现的地址，根据地址去方法区调用对应的函数实现
     */

}


#pragma mark - 交换方法
- (void) exchangeMethod{
    /*
        runtime 交换方法 ： 只为修改“系统”的方法实现
     
        需求：
        有一个已经开发了2年的项目，突然需要添加一个功能，每次添加UIImage的时候，告诉外界是否添加成功
     
        解决方式：
        方式1. 继承UIImage 自定义UIImage类 重写系统方法
        弊端：
            1.每次使用，都必须导入头文件
            2.项目已经实现2年，太大了 没法实现
     
     
        方式2. 给UIImage添加分类
        给系统方法imageNamed添加功能，只能使用runtime的交换方法
        ①给系统类添加分类
        ②自己实现一个带有扩展功能的方法
        ③交换方法，每次只交换一次（可以写在load方法中）
     */
    
    
    // 方式1 (不推荐)
    UIImage * image1 = [ZYImage imageNamed:@"1"];
    
    // 方式2 （在分类中使用runtime的交换方法）
    UIImage * image2 = [UIImage zy_imageNamed:@"1"];
}

#pragma mark - 动态添加方法
- (void) performResolveMethod{
    /*
        OC都是懒加载机制，只要有一个方法实现了，就会马上添加到方法列表中，
     
        美团有个面试题?有没有使用过performSelector,什么时候使用?动态添加方法的时候使用过?怎么动态添加方法?用runtime?为什么要动态添加方法?
     */
    
    /*
        每个方法都有两个隐藏参数
        一个是self  一个是_cmd即当前方法的方法编号
     */
    NSLog(@"%@",NSStringFromSelector(_cmd));
    
    ZYPerson2 * p = [[ZYPerson2 alloc]init];
    
    // 没有参数
//    [p performSelector:@selector(study)];
    
    // 有参数
    [p performSelector:@selector(study) withObject:@10];
}


@end
