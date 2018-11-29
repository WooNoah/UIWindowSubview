//
//  ViewController.m
//  DDDDemo
//
//  Created by Noah on 2018/10/16.
//  Copyright © 2018 Noah. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"
#import "EnsureRepayAlertView.h"
#import <Masonry.h>

@interface ViewController ()
@property (strong, nonatomic) TestView *test;

@property (nonatomic,strong) EnsureRepayAlertView *alertView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

/**
 * 主viewcontroller中customAction按钮点击事件（弹出会遮挡导航栏的view）
 */
- (IBAction)customAction:(id)sender {
    self.test = [[TestView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
//    TestView *test = [[TestView alloc]initWithFrame:[UIScreen mainScreen].bounds];
}


/**
 * 主viewcontroller中RepayView按钮点击事件（弹出不会遮挡导航栏的view）
 */
- (IBAction)repayAction:(id)sender {
    self.alertView = [[EnsureRepayAlertView alloc]initWithFrame:self.view.bounds];
//    [self.alertView.confirmButton addTarget:self action:@selector(innerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.alertView];
    [UIView animateWithDuration:.3 animations:^{
        self.alertView.alpha = 1;
    }];
}


@end
