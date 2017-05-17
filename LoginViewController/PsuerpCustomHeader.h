//
//  PsuerpCustomHeader.h
//  Psuerp
//
//  Created by anyifei’s Mac on 2017/5/16.
//  Copyright © 2017年 esteel. All rights reserved.
//

#ifndef PsuerpCustomHeader_h
#define PsuerpCustomHeader_h

// RGB颜色
#define WuboColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// RGB颜色
#define WuboColorR_G_B_A(r, g, b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define WuboScreen [UIScreen mainScreen].bounds
#define WuboScreen_W [UIScreen mainScreen].bounds.size.width
#define WuboScreen_H [UIScreen mainScreen].bounds.size.height
//登录界面view的宽度
#define WuboLoginSingleViewWidth [UIScreen mainScreen].bounds.size.width*0.8
//登录界面View的高度
#define WuboLoginSingleViewHeight [UIScreen mainScreen].bounds.size.height*0.5
//登录头像的半径
#define WuboLoginSingleViewHeaderRadius 40
//登录界面方框圆角半径
#define WuboLoginSingleViewRadius 10
//屏幕正中心w
#define WuboScreen_halfW [UIScreen mainScreen].bounds.size.width*0.5
//屏幕正中心H
#define WuboScreen_halfH [UIScreen mainScreen].bounds.size.height*0.5
//
#ifdef DEBUG
#define WuBoLog(...) printf("[%s] %s [第%d行]: %s\n", __TIME__ ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String])
#else
#define WuBoLog(...)
#endif

#endif /* PsuerpCustomHeader_h */
