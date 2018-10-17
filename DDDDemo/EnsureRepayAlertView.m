//
//  EnsureRepayAlertView.m
//
//  Created by Noah on 17/4/4.
//  Copyright © 2017年 tb. All rights reserved.
//

#import "EnsureRepayAlertView.h"
#import <Masonry.h>


#define UIScreenSize [UIScreen mainScreen].bounds.size
#define widMultiply(x) x*UIScreenSize.width
#define heiMultiply(x) x*UIScreenSize.height
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@interface EnsureRepayAlertView()

//关闭按钮
@property (strong, nonatomic) UIButton *closeBtn;

@end

@implementation EnsureRepayAlertView

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.alpha = 0;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    UIImageView *backView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, UIScreenSize.width, UIScreenSize.height)];
    backView.userInteractionEnabled = YES;
    backView.backgroundColor = [UIColor blackColor];
    backView.alpha = .7;
    [self addSubview:backView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    [backView addGestureRecognizer:tap];
    
    UIView *frontView = [[UIView alloc]init];
    frontView.backgroundColor = [UIColor whiteColor];
    frontView.layer.cornerRadius = 10.f;
    frontView.layer.masksToBounds = YES;
    [self addSubview:frontView];
    
    [frontView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(-heiMultiply(0.1));
        make.size.mas_equalTo(CGSizeMake(widMultiply(.7), widMultiply(.7)*0.78));
    }];
    
    UILabel *titleLbl = [[UILabel alloc]init];
    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, widMultiply(.9), 50);
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    gradientLayer.locations = @[@(0.1),@(1.0)];
    [gradientLayer setColors:@[(id)[RGB(49, 206, 252) CGColor], (id)[RGB(30, 175, 252) CGColor]]];
    [titleLbl.layer addSublayer:gradientLayer];
    
    titleLbl.text = @"请输入还款金额";
    titleLbl.textAlignment = NSTextAlignmentCenter;
    titleLbl.font = [UIFont boldSystemFontOfSize:15];
    titleLbl.userInteractionEnabled = YES;
    titleLbl.textColor = [UIColor whiteColor];
    [frontView addSubview:titleLbl];
    
    [titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(frontView);
        make.left.equalTo(frontView);
        make.right.equalTo(frontView);
        make.height.mas_equalTo(50);
    }];

    self.closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.closeBtn setImage:[UIImage imageNamed:@"x"] forState:UIControlStateNormal];
    self.closeBtn.adjustsImageWhenHighlighted = NO;
    [self.closeBtn addTarget:self action:@selector(dismissAction) forControlEvents:UIControlEventTouchUpInside];
    [titleLbl addSubview:self.closeBtn];
    
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(titleLbl);
        make.right.equalTo(titleLbl).offset(-15);
        make.size.mas_equalTo(CGSizeMake(14, 14));
    }];
    
    self.confirmButton = [[UIButton alloc]init];
    CAGradientLayer *buttonGradientLayer =  [CAGradientLayer layer];
    buttonGradientLayer.frame = CGRectMake(0, 0, widMultiply(.9) - 30, 50);
    buttonGradientLayer.startPoint = CGPointMake(0, 0);
    buttonGradientLayer.endPoint = CGPointMake(1, 0);
    buttonGradientLayer.locations = @[@(0.1),@(1.0)];
    [buttonGradientLayer setColors:@[(id)[RGB(46, 229, 253) CGColor],(id)[RGB(41, 195, 252) CGColor]]];
    [self.confirmButton.layer addSublayer:buttonGradientLayer];
    
    [self.confirmButton setTitle:@"确认" forState:UIControlStateNormal];
    self.confirmButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [frontView addSubview:self.confirmButton];
    
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(frontView);
        make.left.equalTo(frontView);
        make.centerX.equalTo(frontView);
        make.height.mas_equalTo(50);
    }];
    
    self.repayAmount = [[UITextField alloc]init];
    self.repayAmount.layer.borderWidth = 0.5f;
    self.repayAmount.layer.borderColor = RGB(207, 207, 207).CGColor;
    self.repayAmount.keyboardType = UIKeyboardTypeDecimalPad;
    [frontView addSubview:self.repayAmount];
    
    [self.repayAmount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(frontView);
        make.width.equalTo(frontView).multipliedBy(0.66);  // 350 / 530
        make.height.equalTo(frontView).multipliedBy(0.22);   // 90 / 410
    }];
}


- (void)dismissAction {
    [self dismissKeyboard];
    
    [UIView animateWithDuration:.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

- (void)dismissKeyboard {
    [self.repayAmount resignFirstResponder];
}

@end
