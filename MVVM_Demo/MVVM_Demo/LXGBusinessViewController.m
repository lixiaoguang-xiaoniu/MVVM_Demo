//
//  LXGBusinessViewController.m
//  MVVM_Demo
//
//  Created by LeeMichael on 8/4/16.
//  Copyright © 2016 xiaoniu. All rights reserved.
//

#import "LXGBusinessViewController.h"

@implementation LXGBusinessViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label];
    label.layer.cornerRadius = 0.5;
    
    label.text = @"my label";
    label.frame = CGRectMake(100, 100, 100, 100);
    
    label.clipsToBounds = YES;

}
@end
