//
//  LoginAnimationButton.h
//  Psuerp
//
//  Created by anyifei’s Mac on 2017/5/16.
//  Copyright © 2017年 esteel. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LoginAnimationButton;
@protocol LoginAnimationButtonDelegate <NSObject>
/**
 *  动画开始回调
 *
 *  @param LoginAnimationButton self
 */
-(void)loginAnimationButtonDidStartAnimation:(LoginAnimationButton*)LoginAnimationButton;

/**
 *  动画已经结束时回调
 *
 *  @param LoginAnimationButton self
 */
-(void)loginAnimationButtonDidFinishAnimation:(LoginAnimationButton *)LoginAnimationButton;

/**
 *  动画将要结束时回调  即 结束动画未执行时
 *
 *  @param LoginAnimationButton self
 */
-(void)loginAnimationButtonWillFinishAnimation:(LoginAnimationButton *)LoginAnimationButton;
/**
 *  登录失败回调
 *
 *  @param LoginAnimationButton self
 */
-(void)loginAnimationButtonFailAnimation:(LoginAnimationButton *)LoginAnimationButton;

@end

@interface LoginAnimationButton : UIButton
/**
 *  创建对象
 *
 *
 *  @return 对象
 */
+(instancetype)buttonWithFrame:(CGRect)frame;
/**
 *  边缘色
 *
 */
-(void)setborderColor:(UIColor*)color;
/**
 *  边缘宽度
 *
 */
-(void)setborderWidth:(CGFloat)width;
/**
 *  手动调用执行动画  一般在 button 的响应里调用  调用后会走代理进行回调
 */
-(void)startAnimation;
/**
 *  手动停止动画 停止前和停止后会走代理回调 失败
 */
-(void)stopAnimationFail;
/**
 *  手动停止动画 停止前和停止后会走代理回调 成功
 */
-(void)stopAnimationSuccess;

/**
 *  代理对象
 */
@property (nonatomic, weak) id <LoginAnimationButtonDelegate> delegate;
@end
