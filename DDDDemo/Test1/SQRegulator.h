//
//  SQRegulator.h
//  ZJNews
//
//  Created by Franky on 2017/9/6.
//  Copyright © 2017年 Bella. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 监管机构图片
@interface SQImageModel : NSObject <NSCoding>
/**
 logo知道吧?就是logo
 */
@property (nonatomic, copy) NSDictionary *LOGO;
/**
 icon加了个H,反白icon???
 */
@property (nonatomic, copy) NSDictionary *HICO;
/**
 icon就是icon,不用多说了吧
 */
@property (nonatomic, copy) NSDictionary *ICO;
/**
 背景图片
 */
@property (nonatomic, copy) NSDictionary *BGP;
+ (instancetype)imageModelWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end


/// 国家
@interface SQCountry : NSObject <NSCoding>
@property (nonatomic, copy) NSString *countryCode;
@property (nonatomic, copy) NSString *twoCharCode;
@property (nonatomic, copy) NSString *threeCharCode;
@property (nonatomic, copy) NSString *chineseName;
@property (nonatomic, copy) NSString *englishName;
@property (nonatomic, copy) NSString *isoCode;
+ (instancetype)countryWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end


/// 监管机构
@interface SQRegulator : NSObject

@property (nonatomic, strong) SQImageModel *images;
//@property (nonatomic, strong) SQCountry *country;

@property (nonatomic, copy) NSString *code;
//@property (nonatomic, copy) NSString *regulatorCode;
//@property (nonatomic, copy) NSString *chineseShortName;
//@property (nonatomic, copy) NSString *chineseFullName;
//@property (nonatomic, copy) NSString *englishShortName;
//@property (nonatomic, copy) NSString *englishFullName;
@property (nonatomic, copy) NSString *fullName;
@property (nonatomic, copy) NSString *shortName;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *flag;
@property (nonatomic, copy) NSString *ico;
@property (nonatomic, copy) NSString *banner;
@property (nonatomic, copy) NSString *logo;



@property (nonatomic, copy) NSString *site;
@property (nonatomic, copy) NSString *tel;
@property (nonatomic, copy) NSString *email;

+ (instancetype)regulatorWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end

