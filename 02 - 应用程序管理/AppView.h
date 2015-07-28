//
//  AppView.h
//  02 - 应用程序管理
//
//  Created by 肖晨 on 15/7/7.
//  Copyright (c) 2015年 肖晨. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppInfo, AppView;

@protocol AppViewDelegate <NSObject>

@required
- (void)appViewDidClickDownloadButton:(AppView *)appView;

@end

@interface AppView : UIView

@property (nonatomic, weak)id<AppViewDelegate> delegate;

@property (nonatomic ,strong) AppInfo *appInfo;

+ (instancetype) appView;
+ (instancetype) appViewWithAppInfo:(AppInfo *)appInfo;

@end
