//
//  LoginView.m
//  Psuerp
//
//  Created by anyifei’s Mac on 2017/5/15.
//  Copyright © 2017年 esteel. All rights reserved.
//

#import "LoginView.h"
#import "LoginAnimationButton.h"
//登录界面的宽度
#define selfwith self.bounds.size.width
//登录界面的高度
#define selfHeight self.bounds.size.height
@interface LoginView ()


@end


@implementation LoginView
- (instancetype)init {

    if (self = [super init]) {

    }
    return self;
}
- (void)drawRect:(CGRect)rect {

    
    [self drawRectView];
    [self drawRectAccountLine];
    [self drawRectPasswordLine];

}
- (void)drawRectView {

    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(WuboLoginSingleViewWidth/2+WuboLoginSingleViewHeaderRadius+10, 0)];
    [path addArcWithCenter:CGPointMake(selfwith/2, 0) radius:WuboLoginSingleViewHeaderRadius+10 startAngle:0 endAngle:M_PI clockwise:YES];
    
    [path addLineToPoint:CGPointMake(WuboLoginSingleViewRadius, 0)];
    
    [path addArcWithCenter:CGPointMake(WuboLoginSingleViewRadius, WuboLoginSingleViewRadius) radius:WuboLoginSingleViewRadius startAngle:M_PI*3/2 endAngle:M_PI clockwise:NO];
    
    [path addLineToPoint:CGPointMake(0, selfHeight-WuboLoginSingleViewRadius*2)];
    
    [path addArcWithCenter:CGPointMake(WuboLoginSingleViewRadius, selfHeight-WuboLoginSingleViewRadius) radius:WuboLoginSingleViewRadius startAngle:M_PI endAngle:M_PI/2 clockwise:NO];
    
    [path addLineToPoint:CGPointMake(selfwith-WuboLoginSingleViewRadius, selfHeight)];
    
    [path addArcWithCenter:CGPointMake(selfwith-WuboLoginSingleViewRadius, self.bounds.size.height-WuboLoginSingleViewRadius) radius:WuboLoginSingleViewRadius startAngle:M_PI/2 endAngle:2*M_PI clockwise:NO];
    
    [path addLineToPoint:CGPointMake(selfwith, WuboLoginSingleViewRadius)];
    
    [path addArcWithCenter:CGPointMake(selfwith-WuboLoginSingleViewRadius, WuboLoginSingleViewRadius) radius:WuboLoginSingleViewRadius startAngle:0 endAngle:3*M_PI/2 clockwise:NO];
    
    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineCapRound; //终点处理
    
    [path closePath];
    [path fill];
    CAShapeLayer *shapelayer = [CAShapeLayer layer];
    //    shapelayer.strokeColor = [[UIColor redColor]CGColor];
    shapelayer.fillColor = [[UIColor whiteColor]CGColor];
    shapelayer.path = path.CGPath;
    shapelayer.shadowColor = [UIColor blackColor].CGColor;
    shapelayer.shadowOpacity = 0.8f;
    shapelayer.shadowRadius = 10.0f;
    shapelayer.shadowOffset = CGSizeMake(4,4);
    [self.layer addSublayer:shapelayer];
}
- (void)drawRectAccountLine {

    UIBezierPath *accountLinePath = [UIBezierPath bezierPath];
    [accountLinePath moveToPoint:CGPointMake(20, WuboLoginSingleViewHeight/5+WuboLoginSingleViewHeight/7)];
    [accountLinePath addLineToPoint:CGPointMake(selfwith-20, WuboLoginSingleViewHeight/5+WuboLoginSingleViewHeight/7)];
    [accountLinePath stroke];
    CAShapeLayer *accountShapelayer = [CAShapeLayer layer];
        accountShapelayer.strokeColor = [[UIColor grayColor]CGColor];
    accountShapelayer.path = accountLinePath.CGPath;
    accountShapelayer.shadowColor = [UIColor grayColor].CGColor;
    accountShapelayer.shadowOpacity = 0.8f;
    accountShapelayer.shadowOffset = CGSizeMake(1,1);
    [self.layer addSublayer:accountShapelayer];
    
    
}
- (void)drawRectPasswordLine {

    UIBezierPath *passwordLinePath = [UIBezierPath bezierPath];
    [passwordLinePath moveToPoint:CGPointMake(20, WuboLoginSingleViewHeight/5+WuboLoginSingleViewHeight/7*2+20)];
    [passwordLinePath addLineToPoint:CGPointMake(selfwith-20, WuboLoginSingleViewHeight/5+WuboLoginSingleViewHeight/7*2+20)];
    [passwordLinePath stroke];
    CAShapeLayer *passwordShapelayer = [CAShapeLayer layer];
    passwordShapelayer.strokeColor = [[UIColor grayColor]CGColor];
    passwordShapelayer.path = passwordLinePath.CGPath;
    passwordShapelayer.shadowColor = [UIColor grayColor].CGColor;
    passwordShapelayer.shadowOpacity = 0.8f;
    passwordShapelayer.shadowOffset = CGSizeMake(1,1);
    [self.layer addSublayer:passwordShapelayer];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
