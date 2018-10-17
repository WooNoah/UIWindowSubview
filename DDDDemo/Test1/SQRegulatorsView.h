//
//  SQRegulatorsView.h
//  ZJNews
//
//  Created by Noah on 2018/10/16.
//  Copyright © 2018 FXEYE. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SQRegulatorsView : UIView

+ (instancetype)setupRegulatorsViewWithRegulars:(NSArray *_Nullable)data targetVC:(UIViewController *)targetVC;

- (void)showRegulatorsView;

@end

NS_ASSUME_NONNULL_END
