//
//  AppView.m
//  02 - 应用程序管理
//
//  Created by 肖晨 on 15/7/7.
//  Copyright (c) 2015年 肖晨. All rights reserved.
//

#import "AppView.h"
#import "AppInfo.h"

@interface AppView()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation AppView

+ (instancetype)appView{
    return [[[NSBundle mainBundle] loadNibNamed:@"AppView" owner:nil options:nil] lastObject];
}

+ (instancetype)appViewWithAppInfo:(AppInfo *)appInfo{
    // 实例化一个视图
    AppView *view = [self appView];
    // 设置视图显示
    view.appInfo = appInfo;
    // 返回视图
    return view;
}

- (void)setAppInfo:(AppInfo *)appInfo{
    _appInfo = appInfo;
    self.label.text = appInfo.name;
    self.icon.image = appInfo.image;
}

- (IBAction)click:(UIButton *)button{
    button.enabled = NO;
    
    if ([self.delegate respondsToSelector:@selector(appViewDidClickDownloadButton:)])
    {
        [self.delegate appViewDidClickDownloadButton:self];
    }
}

@end
