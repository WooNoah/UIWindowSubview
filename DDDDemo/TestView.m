//
//  TestView.m
//  DDDDemo
//
//  Created by Noah on 2018/10/17.
//  Copyright © 2018 Noah. All rights reserved.
//

#import "TestView.h"
#import <Masonry.h>
#import "TestViewTwo.h"

@interface TestView ()

@property (strong, nonatomic) UIButton *btn;

@property (strong, nonatomic) UIView *gestureView;

@property (strong, nonatomic) TestViewTwo *two;

@end

@implementation TestView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor lightGrayColor];
        [self configSubviews];
    }
    return self;
}

- (void)configSubviews {
    self.gestureView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.gestureView.backgroundColor = [UIColor colorWithWhite:0.4 alpha:1];
    self.gestureView.alpha = 0;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [self.gestureView addGestureRecognizer:tap];
    [[[[UIApplication sharedApplication] delegate] window] addSubview:self.gestureView];
    
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.backgroundColor = [UIColor orangeColor];
    self.btn.frame = CGRectMake(100, 100, 100, 44);
    [self.btn setTitle:@"customButton" forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [[[[UIApplication sharedApplication] delegate] window] addSubview:self.btn];
    
    
    self.two = [[TestViewTwo alloc]init];
    self.two.backgroundColor = [UIColor greenColor];
    [self.gestureView addSubview:self.two];
    [self.two mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(190));
        make.centerX.equalTo(self.gestureView);
        make.left.equalTo(self.gestureView).offset(50);
        make.height.equalTo(self.two.mas_width);
    }];
    
    [self show];
}

- (void)show {
    [UIView animateWithDuration:.25 animations:^{
        self.gestureView.alpha = 1;
    }];
}

- (void)dealloc {
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

- (void)btnClick {
    NSLog(@"%@",NSStringFromSelector(_cmd));
    [self.btn removeFromSuperview];
}

- (void)tapAction {
    NSLog(@"%@",NSStringFromSelector(_cmd));
    [self.gestureView removeFromSuperview];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

- (void)touchesEnded:(NSSet<UITouch *> *)toucdhes withEvent:(UIEvent *)event {
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

@end
