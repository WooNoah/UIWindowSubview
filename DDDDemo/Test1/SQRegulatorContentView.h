//
//  SQRegulatorContentView.h
//  ZJNews
//
//  Created by Franky on 2017/9/13.
//  Copyright © 2017年 Bella. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SQRegulatorButton;

@protocol SQRegulatorContentViewDelegate <NSObject>

- (void)didClickRegulatorButton:(SQRegulatorButton *)sender;

@end

@interface SQRegulatorContentView : UIView

- (instancetype)initWithRegulators:(NSArray *)regulators;

@property (nonatomic, copy) NSArray *regulators;

@property (nonatomic, assign) CGFloat selfHeight;

@property (nonatomic, weak) id<SQRegulatorContentViewDelegate> delegate;

@end


@class SQRegulator;

@interface SQRegulatorButton : UIView

@property (nonatomic, strong) SQRegulator *regulator;

@property (nonatomic, strong) UILabel *chineseLabel;

@property (nonatomic, strong) UILabel *englishLabel;

@end
