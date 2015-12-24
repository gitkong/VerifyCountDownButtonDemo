//
//  FLButton.m
//  verifyButtonDemo
//
//  Created by 孔凡列 on 15/12/24.
//  Copyright © 2015年 czebd. All rights reserved.
//

#import "FLVerifyButton.h"

@interface FLVerifyButton (){
    NSTimer *timer;// 定时器
    NSInteger originalCountDownTime;// 记录调用者传入的时间戳
}

@end

@implementation FLVerifyButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI{
    // 创建默认文本显示
    if (self.titleLabel.text == nil) {
        [self setTitle:normalText forState:UIControlStateNormal];
    }
    // 裁剪
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    
    if (!self.countDownTime) {
        self.countDownTime = 60;// 默认60s
        originalCountDownTime = 60;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [timer invalidate];
    NSTimer *oldTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeCountDown) userInfo:nil repeats:YES];
    timer = oldTimer;
}

- (void)timeCountDown{
    _countDownTime --;
    NSString *countDownTimeStr = [NSString stringWithFormat:@"%zds",self.countDownTime];
    [self setTitle:countDownTimeStr forState:UIControlStateNormal];
    if (_countDownTime == 0) {
        [timer invalidate];
        self.countDownTime = originalCountDownTime;
        if (self.verifyCountDownCompete) {
            self.verifyCountDownCompete();
        }
        [self setTitle:countDownEndText forState:UIControlStateNormal];
        
    }
}

- (instancetype)initWithCountDownTime:(NSInteger)countDownTime compete:(VerifyCountDownCompete)countDownCompete{
    if (self = [super init]) {
        self.countDownTime = countDownTime;
        self.verifyCountDownCompete = countDownCompete;
    }
    return self;
    
}

#pragma mark - setter & getter

- (void)setCountDownTime:(NSInteger)countDownTime{
    _countDownTime = countDownTime;
    originalCountDownTime = _countDownTime;
}

@end
