//
//  AppInfo.h
//  02 - 应用程序管理
//
//  Created by 肖晨 on 15/7/7.
//  Copyright (c) 2015年 肖晨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AppInfo : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;

@property (nonatomic, strong, readonly) UIImage *image;

/** 
    instancetype 主要用于在类方法实例化对象时，让编译器主动推断对象的实际类型
    以避免使用id，造成开发中不必要的麻烦
 */

// 通常在模型的实例化方法时，以下两种方法都要写
- (instancetype)initWithDict:(NSDictionary *)dict;
// 类方法可以快速实例化一个对象
+ (instancetype)appInfoWithDict:(NSDictionary *)dict;

+ (NSArray *)appList;

@end
