//
//  LXGHomeViewController.m
//  MVVM_Demo
//
//  Created by LeeMichael on 8/4/16.
//  Copyright © 2016 xiaoniu. All rights reserved.
//

#import "LXGHomeViewController.h"
#import "LXGBusinessVC.h"
#import "LXGBusinessVM.h"
#import "LXGUserEntity.h"
@interface LXGHomeViewController ()
/** VM */
@property (nonatomic, strong) LXGBusinessVM *viewModel;
@end
@implementation LXGHomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"go" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(gotonext:) forControlEvents:UIControlEventTouchUpInside];
    [btn mas_makeConstraints:^(MASConstraintMaker *make){
        make.center.equalTo(self.view);
        make.width.equalTo(@80);
        make.height.equalTo(@40);
    }];
    
    [RACObserve(self, viewModel.userArr) subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    NSMutableArray *mArr = [NSMutableArray array];
    for (NSInteger i = 0; i < 10; i++) {
        LXGUserEntity *entity = [[LXGUserEntity alloc] init];
        entity.firstName = [NSString stringWithFormat:@"%zd.",i];
        [mArr addObject:entity];
    }
    
    self.viewModel = [[LXGBusinessVM alloc] initWithUserArr:mArr];
    [self.viewModel setArr:mArr];
   

}
- (void)gotonext:(id)sender {
    NSMutableArray *marr = [NSMutableArray array];
    for (NSInteger i=0; i<20; i++) {
        LXGUserEntity *userEntity = [[LXGUserEntity alloc] init];
        userEntity.firstName = [NSString stringWithFormat:@"%zd",arc4random()%50000];
        [marr addObject:userEntity];
    }
    
//    NSArray <id<LXGUserProtocol>> *arr = [NSArray arrayWithObject:userEntity];
    LXGBusinessVM *vm = [[LXGBusinessVM alloc] initWithUserArr:marr];
    LXGBusinessVC *vc = [[LXGBusinessVC alloc] initWithViewModel:vm];
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
