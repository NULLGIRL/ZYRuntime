//
//  ViewController.m
//  3.1 UIAlertViewBYRuntime
//
//  Created by Momo on 17/4/6.
//  Copyright © 2017年 Momo. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertView+ActionBlock.h"

@interface ViewController ()<UIAlertViewDelegate>

@end

@implementation ViewController

#pragma mark - life circle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - action method
- (IBAction)firstBtnClick:(UIButton *)sender {
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"title" message:@"message" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    alertView.callBack = ^(UIAlertView *alert,NSUInteger buttonIndex){
        if (buttonIndex == 1) {
            NSLog(@"魔法alertView1001执行ok");
        }

    };
    alertView.tag = 1001;
    [alertView show];
}
- (IBAction)secondBtnClick:(UIButton *)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"title" message:@"message" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    alertView.callBack = ^(UIAlertView *alertView, NSUInteger buttonIndex){
        if (buttonIndex == 1) {
            NSLog(@"魔法alertView1002执行ok");
        }
    };
    alertView.tag = 1002;
    [alertView show];
}
- (IBAction)threeBtnClick:(UIButton *)sender {
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"title" message:@"message" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    alertView.tag = 1003;
    [alertView show];
}
- (IBAction)forthBtnClick:(UIButton *)sender {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *alertAction){
        NSLog(@"如果你是iOS8以上的应用，这个适合你，简单明了");
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];

}

#pragma mark - delegate method
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 1001) {
        if (buttonIndex == 1) {
            NSLog(@"普通alertView1001执行ok");
        }
    } else if (alertView.tag == 1002) {
        if (buttonIndex == 1) {
            NSLog(@"普通alertView1002执行ok");
        }
    } else if (alertView.tag == 1003) {
        if (buttonIndex == 1) {
            NSLog(@"普通alertView1003执行ok");
        }
    } else if (alertView.tag == 1004) {
        if (buttonIndex == 1) {
            NSLog(@"普通alertView1004执行ok");
        }
    }
}

@end
