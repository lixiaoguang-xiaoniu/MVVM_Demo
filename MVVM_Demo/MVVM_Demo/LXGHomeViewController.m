//
//  LXGHomeViewController.m
//  MVVM_Demo
//
//  Created by LeeMichael on 8/4/16.
//  Copyright © 2016 xiaoniu. All rights reserved.
//

#import "LXGHomeViewController.h"

@interface LXGHomeViewController()
/** tf */
@property (nonatomic, strong) UITextField *textField;
/** tf2 */
@property (nonatomic, strong) UITextField *passwordField;
/** btn */
@property (nonatomic, strong) UIButton *loginBtn;
@end
@implementation LXGHomeViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(50, 100, 200, 50)];
    self.passwordField = [[UITextField alloc]initWithFrame:CGRectMake(50, 200, 200, 50)];
    self.textField.backgroundColor = [UIColor lightGrayColor];
    self.passwordField.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:self.textField];
    [self.view addSubview:self.passwordField];
    
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn.frame = CGRectMake(100, 300, 100, 40);
    [self.loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginBtn setBackgroundImage:[self imageWithColor:[UIColor lightGrayColor]] forState:UIControlStateDisabled];
    [self.loginBtn setBackgroundImage:[self imageWithColor:[UIColor yellowColor]] forState:UIControlStateNormal];
    [self.view addSubview:self.loginBtn];
    
    //简单订阅
#if 0
    [self.textField.rac_textSignal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
#endif
    //简单信号过滤
#if 0
    [[self.textField.rac_textSignal filter:^BOOL(id value) {
        NSString *text = value;
        return text.length>3;
    }] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
#endif
    //-->步骤分解
#if 0
    RACSignal *sourceSignal = self.textField.rac_textSignal;
    RACSignal *filteredSignal = [sourceSignal filter:^BOOL(id value) {
        NSString *text = value;
        return text.length>3;
    }];
    [filteredSignal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
#endif
    
    
    //-->简化代码
#if 0
    [[self.textField.rac_textSignal filter:^BOOL(NSString *text) {
        return text.length>3;
    }] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
#endif
    
    //信号转化:map
#if 0
    [[[self.textField.rac_textSignal map:^id(NSString *text) {
        return @(text.length); //基础类型必须要包装成对象
    }] filter:^BOOL(NSNumber *length) {
        return length.integerValue > 3;
    }] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
#endif
    
    //用信号刷新UI
#if 1
    //建立信号
    RACSignal *validUserNameSignal = [self.textField.rac_textSignal map:^id(NSString *text) {
        return @([self isValidUserName:text]);
    }];
    RACSignal *validPasswordSignal = [self.passwordField.rac_textSignal map:^id(NSString *text) {
        return @([self isValidPassword:text]);
    }];
    
    
    RAC(self.textField,backgroundColor) = [validUserNameSignal map:^id(NSNumber *passwordValid) {
        return [passwordValid boolValue] ? [UIColor greenColor ] : [UIColor lightGrayColor];
    }];
    
    RAC(self.passwordField,backgroundColor) = [validPasswordSignal map:^id(NSNumber *passwordValid) {
        return [passwordValid boolValue] ? [UIColor greenColor ] : [UIColor lightGrayColor];
    }];
    
    RACSignal *signUpActiveSignal = [RACSignal combineLatest:@[validUserNameSignal,validPasswordSignal] reduce:^id(NSNumber *userNameValid,NSNumber *passwordValid){
        return @(userNameValid.boolValue && passwordValid.boolValue);
    }];
    
    [signUpActiveSignal subscribeNext:^(NSNumber *signUpActive) {
        self.loginBtn.enabled = signUpActive.boolValue;
    }];
    
#endif
    //rac控制事件
#if 1
    [[[[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] doNext:^(id x) {
        self.loginBtn.enabled = NO;
    }] flattenMap:^id(id value) {
        return [self signInSignal];
    }] subscribeNext:^(id x) {
        self.loginBtn.enabled = YES;
        NSLog(@"Sign In result:%@",x);
    }];
    
#endif
}

- (BOOL)isValidUserName:(NSString *)text{
    if(text.length > 3){
        return YES;
    }
    return NO;
}

- (BOOL)isValidPassword:(NSString *)text{
    if(text.length > 3){
        return YES;
    }
    return NO;
}
    
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textField resignFirstResponder];
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void) signInWithUserName:(NSString *)userName password:(NSString *)password completeBlock:(void (^)(BOOL))completeBlock {
    
    [NSThread sleepForTimeInterval:1];
    
    if([userName isEqualToString:@"michael"]){
    completeBlock(YES);
    }
    else{
        completeBlock(NO);
    }
}

- (RACSignal *)signInSignal {
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [self signInWithUserName:self.textField.text password:self.passwordField.text completeBlock:^(BOOL success) {
            [subscriber sendNext:@(success)];
            [subscriber sendCompleted];
        }];
        return nil;
    }];
}


@end
