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
    self.view.backgroundColor = [UIColor redColor];
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label];
    label.layer.cornerRadius = 0.5;
    
}
@end
