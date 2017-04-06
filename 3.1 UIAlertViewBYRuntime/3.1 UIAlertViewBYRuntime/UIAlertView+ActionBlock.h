//
//  UIAlertView+ActionBlock.h
//  3.1 UIAlertViewBYRuntime
//
//  Created by Momo on 17/4/6.
//  Copyright © 2017年 Momo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AlertCallBack)(UIAlertView *,NSUInteger);

@interface UIAlertView (ActionBlock)<UIAlertViewDelegate>

@property (nonatomic,copy) AlertCallBack callBack;

@end
