//
//  LXGHomeViewController.m
//  MVVM_Demo
//
//  Created by LeeMichael on 8/4/16.
//  Copyright © 2016 xiaoniu. All rights reserved.
//

#import "LXGHomeViewController.h"

@implementation LXGHomeViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(10, 80, 300, 50);
    label.backgroundColor = [UIColor redColor];
    label.layer.cornerRadius = 10;
    label.clipsToBounds = YES;
    [self.view addSubview:label];
    
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@1];
        
        return nil;
        
    }];
    
    [signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
}
@end
