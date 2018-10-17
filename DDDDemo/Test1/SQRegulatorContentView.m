//
//  SQRegulatorContentView.m
//  ZJNews
//
//  Created by Franky on 2017/9/13.
//  Copyright © 2017年 Bella. All rights reserved.
//

#import "SQRegulatorContentView.h"
#import "SQRegulator.h"
#import <Masonry.h>

@implementation SQRegulatorContentView

- (instancetype)initWithRegulators:(NSArray *)regulators{
    if (self = [super init]) {
        
        NSInteger columnCount = 4;
        CGFloat boundaryMargin = 640 / 750 * 30;
        CGFloat margin = 640 / 750 * 18;
        CGFloat topMargin = 640 / 750 * 20;
        CGFloat subW = (640 - 2 * boundaryMargin - (columnCount - 1) * margin) * 1.0 / columnCount;
        CGFloat subH = 640 / 750 * 78;
        CGFloat subX = 0;
        CGFloat subY = 0;
        for (int i = 0; i < regulators.count; ++i) {
            NSInteger rowIndex = i / columnCount;
            NSInteger columnIndex = i % columnCount;
            subX = boundaryMargin + columnIndex * (subW + margin);
            subY = topMargin + rowIndex * (subH + topMargin);
            SQRegulatorButton *subView = [[SQRegulatorButton alloc] init];
            subView.tag = i + 100;
            subView.regulator = regulators[i];
            subView.frame = CGRectMake(subX, subY, subW, subH);
//            ViewBorder(subView, 0.5, UIColorFromRGB(0xE5E5E5));
            [self addSubview:subView];
            
            UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRegulatorButton:)];
            [subView addGestureRecognizer:tapGestureRecognizer];
        }
        
        SQRegulatorButton *btn = self.subviews.lastObject;
        CGFloat selfHeight = CGRectGetMaxY(btn.frame) + topMargin;
        self.selfHeight = selfHeight;
    }
    return self;
}

#pragma mark - 事件
- (void)tapRegulatorButton:(UITapGestureRecognizer *)sender{
    SQRegulatorButton *btn = (SQRegulatorButton *)sender.view;
    if ([self.delegate respondsToSelector:@selector(didClickRegulatorButton:)]) {
        [self.delegate didClickRegulatorButton:btn];
    }
}

- (void)dealloc {
    NSLog(@"%@-%@", NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

@end



@implementation SQRegulatorButton

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.chineseLabel = [[UILabel alloc] init];
        self.chineseLabel.textColor = [UIColor redColor];
        self.chineseLabel.font = [UIFont systemFontOfSize:12];
        self.chineseLabel.adjustsFontSizeToFitWidth = YES;
        self.chineseLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.chineseLabel];
        [self.chineseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self);
            make.left.right.equalTo(self);
        }];
        
        
        
//        self.englishLabel = [[UILabel alloc] init];
//        self.englishLabel.textColor = UIColorFromRGB(0x43464f);
//        self.englishLabel.font = [UIFont systemFontOfSize:9];
//        [self addSubview:self.englishLabel];
//        [self.englishLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(self);
//            make.top.equalTo(self.chineseLabel.mas_bottom).offset(640 / 750 * 4);
//        }];
    }
    return self;
}

- (void)setRegulator:(SQRegulator *)regulator{
    _regulator = regulator;
    self.chineseLabel.text = regulator.shortName;
//    self.englishLabel.text = regulator.shortName;
}

@end
