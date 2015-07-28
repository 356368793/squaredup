//
//  ViewController.m
//  02 - 应用程序管理
//
//  Created by 肖晨 on 15/7/6.
//  Copyright (c) 2015年 肖晨. All rights reserved.
//

#import "ViewController.h"
#import "AppInfo.h"
#import "AppView.h"

#define kAppViewW 80
#define kAppViewH 90
#define kColCount 3
#define kStartY 20

@interface ViewController ()<AppViewDelegate>
@property (nonatomic, strong) NSArray *appList;
@property (strong, nonatomic) UILabel *label;

@end

@implementation ViewController

- (UILabel *)label
{
    if (_label == nil) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(80, 400, (self.view.bounds.size.width - 160), 40)];
        
        _label.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.2];
        _label.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_label];
        _label.alpha = 0.0;
        _label.font = [UIFont systemFontOfSize:14];
    }
    return _label;
}

- (NSArray *)appList{
    if (_appList == nil) {
        // 将临时数组为属性赋值
        _appList = [AppInfo appList];
    }
    return _appList;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // x， y 间距
    CGFloat marginX = (self.view.bounds.size.width - kAppViewW * kColCount) / (kColCount + 1);
    CGFloat marginY = 10;
    // 九宫格
    for (int i = 0; i < self.appList.count; i ++) {
        int row = i / kColCount;
        int col = i % kColCount;
        CGFloat x = marginX + (kAppViewW + marginX) * col;
        CGFloat y = kStartY + marginY + (kAppViewH + marginY) * row;
        
        // 从xib 加载自定义视图
//        AppView *appView = [AppView appView];
        AppView *appView = [AppView appViewWithAppInfo:self.appList[i]];
        appView.frame = CGRectMake(x, y, kAppViewW, kAppViewH);
        [self.view addSubview:appView];
        
        
        appView.delegate = self;
//        // 实现视图内部细节
//        appView.appInfo = self.appList[i];
    }
}
- (void)appViewDidClickDownloadButton:(AppView *)appView{
    self.label.text = appView.appInfo.name;
    
    [UIView animateWithDuration:1.0 animations:^{
        self.label.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            self.label.alpha = 0.0;
        }];
    }];
}
@end
