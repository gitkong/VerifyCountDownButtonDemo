//
//  ViewController.m
//  verifyButtonDemo
//
//  Created by 孔凡列 on 15/12/24.
//  Copyright © 2015年 czebd. All rights reserved.
//

#import "ViewController.h"
#import "FLVerifyButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FLVerifyButton *verityBtn = [[FLVerifyButton alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    verityBtn.backgroundColor = [UIColor orangeColor];
    verityBtn.countDownTime = 5;
    verityBtn.verifyCountDownCompete = ^{
        NSLog(@"%s",__func__);
    };
    [self.view addSubview:verityBtn];
    
    FLVerifyButton *btn = [[FLVerifyButton alloc] initWithCountDownTime:3 compete:^{
        NSLog(@"%s",__func__);
    }];
    btn.backgroundColor = [UIColor orangeColor];
    btn.frame = CGRectMake(100, 100, 100, 30);
//    [self.view addSubview:btn];
}


@end
