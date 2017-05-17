//
//  LoginCircleAnimationView.m
//  Psuerp
//
//  Created by anyifei’s Mac on 2017/5/16.
//  Copyright © 2017年 esteel. All rights reserved.
//

#import "LoginCircleAnimationView.h"
@interface LoginCircleAnimationView ()
@property (nonatomic, strong) UIColor* borderColor;
@property (nonatomic, assign) CGFloat timeFlag;
@property (nonatomic, strong) NSTimer* timer;
@end
@implementation LoginCircleAnimationView
+(instancetype)viewWithButton:(UIButton *)button{
    LoginCircleAnimationView* animationView = [[LoginCircleAnimationView alloc] init];
    
    animationView.frame = CGRectMake(-8, -8, button.frame.size.width + 16, button.frame.size.height + 16);
    
    animationView.backgroundColor = [UIColor clearColor];
    
    animationView.borderColor = button.backgroundColor;
    
    animationView.timeFlag = 0;
    return animationView;
}
-(void)removeFromSuperview{
    [self.timer invalidate];
    [super removeFromSuperview];
}
-(void)startAnimation{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(continueAnimation) userInfo:nil repeats:YES];
    [self.timer fire];
    
}
-(void)continueAnimation{
    self.timeFlag += 0.02;
    
    [self setNeedsDisplay];
    
}
-(void)drawRect:(CGRect)rect{
    
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    
    CGPoint center = CGPointMake(rect.size.width / 2, rect.size.height / 2);
    CGFloat radius = rect.size.width / 2-1;
    CGFloat start = - M_PI_2 + self.timeFlag * 2*M_PI;
    CGFloat end = -M_PI_2 + 0.45 * 2 * M_PI  + self.timeFlag * 2 *M_PI;
    
    [path addArcWithCenter:center radius:radius startAngle:start endAngle:end clockwise:YES];
    
    [self.borderColor setStroke];
    path.lineWidth = 1.5;
    
    [path stroke];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
