//
//  FLButton.h
//  verifyButtonDemo
//
//  Created by 孔凡列 on 15/12/24.
//  Copyright © 2015年 czebd. All rights reserved.
//

#import <UIKit/UIKit.h>

#define normalText @"获取验证码"
#define countDownEndText @"重新获取"

typedef void (^VerifyCountDownCompete)();

@interface FLVerifyButton : UIButton

/**
 *  倒计时完成回调
 */
@property (nonatomic,copy)VerifyCountDownCompete verifyCountDownCompete;

/**
 *  倒计时时间戳，默认60秒
 */
@property (nonatomic,assign)NSInteger countDownTime;


- (instancetype)initWithCountDownTime:(NSInteger)countDownTime compete:(VerifyCountDownCompete)countDownCompete;

@end
