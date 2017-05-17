//
//  LoginAnimationButton.m
//  Psuerp
//
//  Created by anyifei’s Mac on 2017/5/16.
//  Copyright © 2017年 esteel. All rights reserved.
//

#import "LoginAnimationButton.h"
#import "LoginCircleAnimationView.h"
static NSTimeInterval startDuration = 0.3;
static NSTimeInterval endDuration = 0.5;
@interface LoginAnimationButton ()
@property (nonatomic, strong) LoginCircleAnimationView* circleView;
@property (nonatomic, assign) CGRect origionRect;
@end
@implementation LoginAnimationButton
- (LoginCircleAnimationView *)circleView
{
    if (!_circleView) {
        _circleView = [LoginCircleAnimationView viewWithButton:self];
        [self addSubview:_circleView];
    }
    return _circleView;
}

+(instancetype)buttonWithFrame:(CGRect)frame{
    LoginAnimationButton* button = [LoginAnimationButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = frame;
    button.layer.cornerRadius = 5;
    button.layer.masksToBounds = YES;
    button.clipsToBounds = NO;
    button.origionRect = button.frame;
    return button;
}


-(void)setborderColor:(UIColor *)color{
    self.layer.borderColor = color.CGColor;
    
}

-(void)setborderWidth:(CGFloat)width{
    self.layer.borderWidth = width;
}



-(void)startAnimation{
    CGPoint center = self.center;
    CGFloat width = self.frame.size.height/2;
    CGFloat height = self.frame.size.height/2;
    CGRect desFrame = CGRectMake(center.x - width / 2, center.y - height / 2, width, height);
    
    self.userInteractionEnabled = NO;
    
    if ([self.delegate respondsToSelector:@selector(loginAnimationButtonDidStartAnimation:)]) {
        [self.delegate loginAnimationButtonDidStartAnimation:self];
    }
    
    [UIView animateWithDuration:startDuration animations:^{
        self.titleLabel.alpha = .0f;
        self.frame = desFrame;
    } completion:^(BOOL finished) {
        
        [self.circleView startAnimation];
    }];
}
-(void)stopAnimationSuccess {

    self.userInteractionEnabled = YES;
    
    
    if ([self.delegate respondsToSelector:@selector(loginAnimationButtonWillFinishAnimation:)]) {
        [self.delegate loginAnimationButtonWillFinishAnimation:self];
    }
    
    [self.circleView removeFromSuperview];
    self.circleView = nil;
    [UIView animateWithDuration:endDuration animations:^{
        self.frame = self.origionRect;
        self.titleLabel.alpha = 1.0f;
    } completion:^(BOOL finished) {
        if ([self.delegate respondsToSelector:@selector(loginAnimationButtonDidFinishAnimation:)]) {
            [self.delegate loginAnimationButtonDidFinishAnimation:self];
        }
    }];

}
-(void)stopAnimationFail{
    self.userInteractionEnabled = YES;
    
    
    if ([self.delegate respondsToSelector:@selector(loginAnimationButtonWillFinishAnimation:)]) {
        [self.delegate loginAnimationButtonWillFinishAnimation:self];
    }
    
    [self.circleView removeFromSuperview];
    self.circleView = nil;
    [UIView animateWithDuration:endDuration animations:^{
        self.frame = self.origionRect;
        self.titleLabel.alpha = 1.0f;
    } completion:^(BOOL finished) {
        if ([self.delegate respondsToSelector:@selector(loginAnimationButtonFailAnimation:)]) {
            [self.delegate loginAnimationButtonFailAnimation:self];
        }
    }];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
