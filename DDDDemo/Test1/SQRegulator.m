
//  SQRegulator.m
//  ZJNews
//
//  Created by Franky on 2017/9/6.
//  Copyright © 2017年 Bella. All rights reserved.
//

#import "SQRegulator.h"

@implementation SQImageModel

+ (instancetype)imageModelWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues{
    [keyedValues.allKeys enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *dict = keyedValues[obj];
        [dict.allKeys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([dict[obj] isKindOfClass:[NSNull class]]) {
                [dict setValue:@"" forKey:obj];
            }
        }];
    }];
    [super setValuesForKeysWithDictionary:keyedValues];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.LOGO forKey:@"LOGO"];
    [aCoder encodeObject:self.HICO forKey:@"HICO"];
    [aCoder encodeObject:self.ICO forKey:@"ICO"];
    [aCoder encodeObject:self.BGP forKey:@"BGP"];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.LOGO = [aDecoder decodeObjectForKey:@"LOGO"];
        self.HICO = [aDecoder decodeObjectForKey:@"HICO"];
        self.ICO = [aDecoder decodeObjectForKey:@"ICO"];
        self.BGP = [aDecoder decodeObjectForKey:@"BGP"];
    }
    return self;
}
- (NSString *)description{
    return [NSString stringWithFormat:@"%@\n\tself.LOGO = %@\n\tself.HICO = %@\n\tself.ICO = %@",[super description],self.LOGO,self.HICO,self.ICO];
}
@end



@implementation SQCountry

+ (instancetype)countryWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.countryCode = [aDecoder decodeObjectForKey:@"countryCode"];
        self.twoCharCode = [aDecoder decodeObjectForKey:@"twoCharCode"];
        self.threeCharCode = [aDecoder decodeObjectForKey:@"threeCharCode"];
        self.chineseName = [aDecoder decodeObjectForKey:@"chineseName"];
        self.englishName = [aDecoder decodeObjectForKey:@"englishName"];
        self.isoCode = [aDecoder decodeObjectForKey:@"isoCode"];
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.countryCode forKey:@"countryCode"];
    [aCoder encodeObject:self.twoCharCode forKey:@"twoCharCode"];
    [aCoder encodeObject:self.threeCharCode forKey:@"threeCharCode"];
    [aCoder encodeObject:self.chineseName forKey:@"chineseName"];
    [aCoder encodeObject:self.englishName forKey:@"englishName"];
    [aCoder encodeObject:self.isoCode forKey:@"isoCode"];
}
@end



@implementation SQRegulator
+ (instancetype)regulatorWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues{
    [super setValuesForKeysWithDictionary:keyedValues];
   /*
    self.country = [SQCountry countryWithDict:keyedValues[@"country"]];
    NSArray *images = keyedValues[@"images"];
    NSMutableArray *tempArr = [NSMutableArray arrayWithCapacity:3];
    [images enumerateObjectsUsingBlock:^(NSDictionary* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SQImageModel *image = [SQImageModel imageModelWithDict:obj];
        [tempArr addObject:image];
    }];
    self.images = tempArr.copy;
    */
    
    self.images = [SQImageModel imageModelWithDict:keyedValues[@"images"]];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"description"]) {
        self.desc = value;
    }
}
//
//- (NSString *)description{
//    return [NSString stringWithFormat:@"%@\nself.images = %@\nself.country = %@\nself.regulatorCode = %@\nself.chineseShortName = %@\nself.chineseFullName = %@\nself.englishShorName = %@\nself.englishFullName = %@\nself.site = %@\nself.tel = %@\nself.email = %@\nself.description = %@",[super description],self.images,self.country,self.regulatorCode,self.chineseShortName,self.chineseFullName,self.englishShortName,self.englishFullName,self.site,self.tel,self.email,self.desc];
//}
//
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.images = [aDecoder decodeObjectOfClass:[SQImageModel class] forKey:NSStringFromSelector(@selector(images))];
//        self.country = [aDecoder decodeObjectOfClass:[SQCountry class] forKey:NSStringFromSelector(@selector(country))];
        self.code = [aDecoder decodeObjectOfClass:[NSString class] forKey:NSStringFromSelector(@selector(code))];
        self.shortName = [aDecoder decodeObjectOfClass:[NSString class] forKey:NSStringFromSelector(@selector(shortName))];
        self.fullName = [aDecoder decodeObjectOfClass:[NSString class] forKey:NSStringFromSelector(@selector(fullName))];

        self.desc = [aDecoder decodeObjectOfClass:[NSString class] forKey:NSStringFromSelector(@selector(desc))];
        self.flag = [aDecoder decodeObjectOfClass:[NSString class] forKey:NSStringFromSelector(@selector(flag))];
        self.ico = [aDecoder decodeObjectOfClass:[NSString class] forKey:NSStringFromSelector(@selector(ico))];
        self.banner = [aDecoder decodeObjectOfClass:[NSString class] forKey:NSStringFromSelector(@selector(banner))];
        self.logo = [aDecoder decodeObjectOfClass:[NSString class] forKey:NSStringFromSelector(@selector(logo))];

        self.site = [aDecoder decodeObjectOfClass:[NSString class] forKey:NSStringFromSelector(@selector(site))];
        self.tel = [aDecoder decodeObjectOfClass:[NSString class] forKey:NSStringFromSelector(@selector(tel))];
        self.email = [aDecoder decodeObjectOfClass:[NSString class] forKey:NSStringFromSelector(@selector(email))];
        self.desc = [aDecoder decodeObjectOfClass:[NSString class] forKey:NSStringFromSelector(@selector(desc))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.images forKey:NSStringFromSelector(@selector(images))];
//    [aCoder encodeObject:self.country forKey:NSStringFromSelector(@selector(country))];
    [aCoder encodeObject:self.code forKey:NSStringFromSelector(@selector(code))];
    [aCoder encodeObject:self.shortName forKey:NSStringFromSelector(@selector(shortName))];
    [aCoder encodeObject:self.fullName forKey:NSStringFromSelector(@selector(fullName))];
    [aCoder encodeObject:self.desc forKey:NSStringFromSelector(@selector(desc))];
    [aCoder encodeObject:self.flag forKey:NSStringFromSelector(@selector(flag))];
    [aCoder encodeObject:self.ico forKey:NSStringFromSelector(@selector(ico))];
    [aCoder encodeObject:self.banner forKey:NSStringFromSelector(@selector(banner))];
    [aCoder encodeObject:self.logo forKey:NSStringFromSelector(@selector(logo))];

    [aCoder encodeObject:self.site forKey:NSStringFromSelector(@selector(site))];
    [aCoder encodeObject:self.tel forKey:NSStringFromSelector(@selector(tel))];
    [aCoder encodeObject:self.email forKey:NSStringFromSelector(@selector(email))];
    [aCoder encodeObject:self.desc forKey:NSStringFromSelector(@selector(desc))];
}

@end
