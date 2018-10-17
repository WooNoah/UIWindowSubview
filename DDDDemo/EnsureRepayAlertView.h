//
//  EnsureRepayAlertView.h
//
//  Created by Noah on 17/4/4.
//  Copyright © 2017年 tb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnsureRepayAlertView : UIView

//输入还款金额
@property (strong, nonatomic) UITextField *repayAmount;

//确定按钮
@property (strong, nonatomic) UIButton *confirmButton;

@end
