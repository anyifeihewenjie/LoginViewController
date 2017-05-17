//
//  LoginController.m
//  Psuerp
//
//  Created by anyifei’s Mac on 2017/5/15.
//  Copyright © 2017年 esteel. All rights reserved.
//

#import "LoginController.h"
#import "LoginView.h"
#import "LoginAnimationButton.h"
@interface LoginController ()<LoginAnimationButtonDelegate>
@property (nonatomic ,strong)LoginView *loginView;
@property (nonatomic ,copy)UILabel *titleLabel;
@property (nonatomic ,strong)UIImageView *headerImage;
@property (nonatomic ,strong)LoginAnimationButton *loginBtn;
@property (nonatomic ,strong)UITextField *accountNumberTF;
@property (nonatomic ,strong)UITextField *passwordTF;
@property (nonatomic ,strong)UISwitch *rememberSwitch;
@property (nonatomic ,copy)UILabel *rememberLable;
@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view addSubview:self.loginView];//一定要把白色view放到最底层
    [self.view addSubview:self.headerImage];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.accountNumberTF];
    [self.view addSubview:self.passwordTF];
    [self.view addSubview:self.rememberSwitch];
    [self.view addSubview:self.rememberLable];
    
}
- (UILabel *)rememberLable {

    if (!_rememberLable) {
        _rememberLable = [[UILabel alloc]initWithFrame:CGRectMake(WuboScreen_halfW-WuboLoginSingleViewWidth/2+20, WuboScreen_halfH-WuboLoginSingleViewHeight/2+WuboLoginSingleViewHeight/5+WuboLoginSingleViewHeight/7*2+40, WuboLoginSingleViewWidth-40-80, 30)];
        _rememberLable.font = [UIFont systemFontOfSize:14];
        _rememberLable.text = @"Remember Me";
        _rememberLable.textColor = [UIColor grayColor];
    }
    return _rememberLable;
}
- (UISwitch *)rememberSwitch {

    if (!_rememberSwitch) {
        _rememberSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(WuboScreen_W-20-(WuboScreen_halfW-WuboLoginSingleViewWidth/2)-50, WuboScreen_halfH-WuboLoginSingleViewHeight/2+WuboLoginSingleViewHeight/5+WuboLoginSingleViewHeight/7*2+40, 50, 25)];
        _rememberSwitch.onTintColor = WuboColor(31, 160, 222);
        _rememberSwitch.tintColor = [UIColor grayColor];
        _rememberSwitch.layer.masksToBounds = YES;
        _rememberSwitch.layer.cornerRadius = _rememberSwitch.bounds.size.height/2;
        _rememberSwitch.backgroundColor = [UIColor grayColor];
        [_rememberSwitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];   // 开关事件切换通知
    }
    return _rememberSwitch;
}
-(void)switchAction:(id)sender {
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    if (isButtonOn) {
        NSLog(@"开");
    }else {
        NSLog(@"关");
    }
}
//账号textField
- (UITextField *)accountNumberTF {

    if (!_accountNumberTF) {
        _accountNumberTF = [[UITextField alloc]initWithFrame:CGRectMake(WuboScreen_halfW-WuboLoginSingleViewWidth/2+20, WuboScreen_halfH-WuboLoginSingleViewHeight/2+WuboLoginSingleViewHeight/5, WuboLoginSingleViewWidth-40, WuboLoginSingleViewHeight/7)];
        _accountNumberTF.backgroundColor = [UIColor clearColor];
        _accountNumberTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _accountNumberTF.placeholder = @"Login";
        _accountNumberTF.font = [UIFont boldSystemFontOfSize:17];
        UIView *view = [[UIView alloc]init];
        view.frame = CGRectMake(0, 0, _accountNumberTF.bounds.size.height, _accountNumberTF.bounds.size.height);
        view.backgroundColor = [UIColor clearColor];
        UIImageView *image = [[UIImageView alloc]init];
        image.center = view.center;
        image.bounds = CGRectMake(0, 0, 25, 25);
        image.image = [UIImage imageNamed:@"account"];
        [view addSubview:image];
        _accountNumberTF.leftView = view;
        _accountNumberTF.leftViewMode=UITextFieldViewModeAlways;
        

        

    }
    return _accountNumberTF;
}

//密码textField
- (UITextField *)passwordTF {

    if (!_passwordTF) {
        _passwordTF = [[UITextField alloc]initWithFrame:CGRectMake(WuboScreen_halfW-WuboLoginSingleViewWidth/2+20, WuboScreen_halfH-WuboLoginSingleViewHeight/2+WuboLoginSingleViewHeight/5+WuboLoginSingleViewHeight/7+20, WuboLoginSingleViewWidth-40, WuboLoginSingleViewHeight/7)];
        _passwordTF.backgroundColor = [UIColor clearColor];
        _passwordTF.placeholder = @"Password";
        _passwordTF.secureTextEntry = YES;
        _passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTF.font = [UIFont boldSystemFontOfSize:17];
        UIView *view = [[UIView alloc]init];
        view.frame = CGRectMake(0, 0, _passwordTF.bounds.size.height, _passwordTF.bounds.size.height);
        view.backgroundColor = [UIColor clearColor];
        UIImageView *image = [[UIImageView alloc]init];
        image.center = view.center;
        image.bounds = CGRectMake(0, 0, 25, 25);
        image.image = [UIImage imageNamed:@"password"];
        [view addSubview:image];
        _passwordTF.leftView = view;
        _passwordTF.leftViewMode=UITextFieldViewModeAlways;
    }
    return _passwordTF;
}

//登录按钮
- (LoginAnimationButton *)loginBtn {

    if (!_loginBtn) {
        _loginBtn = [LoginAnimationButton buttonWithFrame:CGRectMake((WuboScreen_halfW-WuboLoginSingleViewWidth/2)+20, WuboScreen_halfH+WuboLoginSingleViewHeight/2-WuboLoginSingleViewHeight/8-15, WuboLoginSingleViewWidth-40, WuboLoginSingleViewHeight/8)];
        _loginBtn.delegate = self;
        [_loginBtn setTitle:@"Sign  in" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn setBackgroundColor:WuboColor(31, 160, 222)];
        [_loginBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}
//头像
- (UIImageView *)headerImage {

    if (!_headerImage) {
        _headerImage = [[UIImageView alloc]init];
        _headerImage.center = CGPointMake(WuboScreen_halfW, WuboScreen_halfH-WuboLoginSingleViewHeight/2);
        _headerImage.bounds = CGRectMake(0, 0, 80, 80);
        _headerImage.backgroundColor = [UIColor clearColor];
        _headerImage.image = [UIImage imageNamed:@"我的物泊背景头像"];
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:_headerImage.bounds byRoundingCorners:UIRectEdgeAll |  UIRectCornerBottomLeft cornerRadii:CGSizeMake(_headerImage.frame.size.width, _headerImage.frame.size.height)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
        maskLayer.frame = _headerImage.bounds;
        maskLayer.path = path.CGPath;
        _headerImage.layer.mask = maskLayer;
    }
    return _headerImage;
}
//标题
- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.center = CGPointMake(WuboScreen_halfW, WuboScreen_halfH-WuboLoginSingleViewHeight/2-80);
        _titleLabel.font = [UIFont systemFontOfSize:25];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"ERP";
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.bounds = CGRectMake(0, 0, WuboScreen_W-40, 30);
    }
    return _titleLabel;
}
//白色界面
- (LoginView *)loginView {

    if (!_loginView) {
        _loginView = [[LoginView alloc] init];
        _loginView.center = CGPointMake(WuboScreen_halfW, WuboScreen_halfH);
        _loginView.bounds = CGRectMake(0, 0, WuboLoginSingleViewWidth, WuboLoginSingleViewHeight);
        _loginView.backgroundColor = [UIColor clearColor];
    }
    return _loginView;
}
- (void)click:(LoginAnimationButton *)button {
    
    [button startAnimation];
}
#pragma mark loginAnimationButtonDelegate
-(void)loginAnimationButtonDidStartAnimation:(LoginAnimationButton*)LoginAnimationButton {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //模拟请求数据
        [LoginAnimationButton stopAnimationSuccess];
    });
}

-(void)loginAnimationButtonDidFinishAnimation:(LoginAnimationButton *)LoginAnimationButton {
}

-(void)loginAnimationButtonWillFinishAnimation:(LoginAnimationButton *)LoginAnimationButton {
    
    
}
-(void)loginAnimationButtonFailAnimation:(LoginAnimationButton *)LoginAnimationButton {
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
