//
//  NSDictionary+ZYProperty.m
//  ZYRuntime
//
//  Created by Momo on 17/2/24.
//  Copyright © 2017年 Momo. All rights reserved.
//

#import "NSDictionary+ZYProperty.h"

@implementation NSDictionary (ZYProperty)

// isKindOfClass:判断是否是当前类或者子类
// 生成属性代码 => 根据字典中所有key
-(void)createPropertyCode{
    NSMutableString * codes = [[NSMutableString alloc] init];
    //遍历字典
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull value, BOOL * _Nonnull stop) {
        NSString * codeStr;
        if ([value isKindOfClass:[NSString class]]) {
            codeStr = [NSString stringWithFormat:@"@property (nonatomic, strong) NSString *%@;",key];
        }
        else if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            codeStr = [NSString stringWithFormat:@"@property (nonatomic, assign) Bool %@;",key];
        }
        else if ([value isKindOfClass:[NSNumber class]]) {
            codeStr = [NSString stringWithFormat:@"@property (nonatomic, assign) NSInteger %@;",key];
        }
        else if ([value isKindOfClass:[NSArray class]]) {
            codeStr = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;",key];
        }
        else if ([value isKindOfClass:[NSDictionary class]]) {
            codeStr = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;",key];
        }
        NSLog(@"%@",codeStr);
//        [codes appendString:@"\n%@\n",codeStr];
        
    }];
    
    NSLog(@"%@",codes);
}

@end
