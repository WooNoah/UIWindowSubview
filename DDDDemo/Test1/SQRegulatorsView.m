//
//  SQRegulatorsView.m
//  ZJNews
//
//  Created by Noah on 2018/10/16.
//  Copyright © 2018 FXEYE. All rights reserved.
//

#import "SQRegulatorsView.h"
#import "SQRegulatorContentView.h"
#import <Masonry.h>
#import "UIView+Extension.h"

@interface SQRegulatorsView() <SQRegulatorContentViewDelegate>

@property (nonatomic, strong) UIView *coverView;
@property (nonatomic, strong) UIButton *backBtn;
//背景view
@property (strong, nonatomic) UIView *listView;

@property (nonatomic, strong) NSArray *regulators;

@property (strong, nonatomic) UIViewController *targetVC;

@property (strong, nonatomic) SQRegulatorContentView *contentView;

@end

@implementation SQRegulatorsView

- (void)dealloc {
    NSLog(@"%@-%@", NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

+ (instancetype)setupRegulatorsViewWithRegulars:(NSArray *_Nullable)data targetVC:(UIViewController *)targetVC {
    SQRegulatorsView *view = [[self alloc]initWithFrame:CGRectZero data:data targetVC:targetVC];
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame data:(NSArray *_Nullable)data targetVC:(UIViewController *)targetVC {
    if (self = [super initWithFrame:frame]) {
        self.regulators = data;
        self.targetVC = targetVC;
        [self configSubviews];
    }
    return self;
}

- (void)configSubviews {
    UIView *coverView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    coverView.userInteractionEnabled = YES;
    [coverView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
    coverView.alpha = 0;
    [[UIApplication sharedApplication].keyWindow addSubview:coverView];
    self.frame = coverView.bounds;
//    [self.targetVC.view addSubview:coverView];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapCoverView)];
    [coverView addGestureRecognizer:tapGestureRecognizer];
    self.coverView = coverView;
    
//    NSArray * array = (NSArray *)[self getSandBoxCachesDataWithFileName:@"GJGetRegulatorList"];
    NSArray *array = @[];
    if (array.count > 0) {
        self.regulators = array;
    }
    self.contentView = [[SQRegulatorContentView alloc] initWithRegulators:self.regulators];
    
    CGFloat listViewH = 640 / 750 * 187 + self.contentView.selfHeight;
    self.listView = [[UIView alloc] initWithFrame:CGRectMake(0, -listViewH, 640, listViewH)];
    self.listView.userInteractionEnabled = YES;
    [self.listView setBackgroundColor:[UIColor whiteColor]];
    [[UIApplication sharedApplication].keyWindow addSubview:self.listView];
//    [coverView addSubview:self.listView];
    
    UIButton *backBtn = [[UIButton alloc] init];
    [backBtn setImage:[UIImage imageNamed:@"backImage"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(didClickbackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn sizeToFit];
    [self.listView addSubview:backBtn];
    self.backBtn = backBtn;
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.listView);
        make.top.equalTo(self.listView).offset(20);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"titleLabel";
    [self.listView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.listView);
        make.top.equalTo(self.listView).offset(640 / 750 * 66);
    }];
    
    UIView *horizonLine = [[UIView alloc] init];
    [horizonLine setBackgroundColor:[UIColor yellowColor]];
    [self.listView addSubview:horizonLine];
    [horizonLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(640 / 750 * 30);
        make.height.mas_equalTo(640 / 750 * 54);
        make.left.right.equalTo(self.listView);
    }];
    
    UILabel *subTitleLabel = [[UILabel alloc] init];
    [subTitleLabel setText:@"subTitleLabel"];
    [subTitleLabel setTextColor:[UIColor greenColor]];
    [subTitleLabel setFont:[UIFont systemFontOfSize:13]];
    [self.listView addSubview:subTitleLabel];
    [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(horizonLine);
        make.left.equalTo(horizonLine).offset(640 / 750 * 30);
    }];
    
    self.contentView.delegate = self;
    [self.listView addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(horizonLine.mas_bottom);
        make.height.mas_equalTo(self.contentView.selfHeight);
        make.left.right.equalTo(self.listView);
    }];
    

}

- (void)showRegulatorsView {
    [UIView animateWithDuration:0.25 animations:^{
        self.listView.frame = CGRectMake(0, 0, self.listView.width, self.listView.height);
        self.coverView.alpha = 1.0;
    } completion:^(BOOL finished) {
        
    }];
}

/// 这个事件是点击标题下滑出的view的返回按钮
- (void)didClickbackBtn:(UIButton *)sender{
    [UIView animateWithDuration:0.25 animations:^{
        sender.superview.frame = CGRectMake(0, -sender.superview.height, sender.superview.width, sender.superview.height);
        self.coverView.alpha = 0;
    } completion:^(BOOL finished) {
        [sender.superview removeFromSuperview];
        [self.coverView removeFromSuperview];
    }];
}

/// 点击半透明的黑板
- (void)tapCoverView{
    [self didClickbackBtn:self.backBtn];
}

#pragma mark - SQRegulatorContentViewDelegate
/**
 点击了监管机构列表下的按钮
 @param sender 并不是一个按钮...自定义view,包含了俩个label
 */
- (void)didClickRegulatorButton:(SQRegulatorButton *)sender{
    [self didClickbackBtn:self.backBtn];
//    SQOrganizationListController *VC = [[SQOrganizationListController alloc] init];
//    VC.regulatorCode = sender.regulator.code;
//    VC.regulator = sender.regulator;
//    [self.targetVC.navigationController pushViewController:VC animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@",NSStringFromSelector(_cmd));
}


@end
