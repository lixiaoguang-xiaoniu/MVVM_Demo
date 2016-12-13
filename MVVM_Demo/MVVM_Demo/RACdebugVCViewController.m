//
//  RACdebugVCViewController.m
//  MVVM_Demo
//
//  Created by xiaoniu on 11/14/16.
//  Copyright © 2016 xiaoniu. All rights reserved.
//

#import "RACdebugVCViewController.h"
#import "objc/runtime.h"

@interface RACdebugVCViewController ()

@end

@implementation RACdebugVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    unsigned int count = 0;
    // 返回成员属性的数组
     __unsafe_unretained Protocol **ivars = class_copyProtocolList([UIMenuController class], &count);
    
    for (int i = 0; i < count; i++) {
        // 取出成员变量
        Protocol  *ivar = ivars[i];
        
        // 获取属性名
        NSString *ivarName = @(protocol_getName(ivar));
        
        NSLog(@"%@",ivarName);
        
        
    }
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *array=@[@(1),@(2),@(3)];
    NSLog(@"%@",[[[array rac_sequence]map:^id(id value){ return [value stringValue];
    }]foldLeftWithStart:@""reduce:^id(id accumulator,id value){ return [accumulator stringByAppendingString:value];
    }]);
    
    UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(50, 100, 250, 80)];
    tf.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:tf];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(60, 190, 230, 50)];
    [btn setTitle:@"confirm" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [btn setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:btn];
    
    
    
    [tf.rac_textSignal subscribeNext:^(id x) {
        NSLog(@"new value: %@",x);
    } error:^(NSError *error) {
        NSLog(@"error:%@",error);
    } completed:^{
        NSLog(@"completed");
    }];
    
    RACSignal *validEmailSignal = [tf.rac_textSignal map:^id(NSString *value) {
        return @([value rangeOfString:@"@"].location != NSNotFound);
    }];
    
    RAC(btn,enabled) = validEmailSignal;
    RAC(tf,textColor) = [validEmailSignal map:^id(id value) {
        if([value boolValue]){
            return [UIColor greenColor];
        }
        else {
            
            return [UIColor redColor];
        }
    }];
    
    
    btn.rac_command = [[RACCommand alloc] initWithEnabled:validEmailSignal signalBlock:^RACSignal *(id input) {
        NSLog(@"btn was pressed");
        return [RACSignal empty];
    }];
    
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
