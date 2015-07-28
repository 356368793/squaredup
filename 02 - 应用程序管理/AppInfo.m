//
//  AppInfo.m
//  02 - 应用程序管理
//
//  Created by 肖晨 on 15/7/7.
//  Copyright (c) 2015年 肖晨. All rights reserved.
//

#import "AppInfo.h"

@implementation AppInfo
@synthesize image = _image;

- (UIImage *)image{
    if (_image == nil) {
        _image = [UIImage imageNamed:self.icon];
    }
    return _image;
}

- (id)initWithDict:(NSDictionary *)dict{
    // self是对象
    self = [super init];
    if (self) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (id)appInfoWithDict:(NSDictionary *)dict{
    // self 是class
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)appList{
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil]];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    // 遍历数组， 依次转换模型
    for (NSDictionary *dict in array) {
        
        [arrayM addObject:[self appInfoWithDict:dict]];
        
    }
    return arrayM;
}

@end
