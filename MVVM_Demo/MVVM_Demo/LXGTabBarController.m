//
//  LXGTabBarController.m
//  MVVM_Demo
//
//  Created by LeeMichael on 8/4/16.
//  Copyright © 2016 xiaoniu. All rights reserved.
//

#import "LXGTabBarController.h"
#import "LXGNavigationController.h"
#import "LXGHomeViewController.h"
#import "LXGBusinessViewController.h"

@implementation LXGTabBarController

+(void)initialize{
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:144.0/255 green:181.0/255 blue:49.0/255 alpha:1];;
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    
}

-(void)viewDidLoad{
    [super viewDidLoad];
    LXGHomeViewController *homeVc = [[LXGHomeViewController alloc]init];
    [homeVc.tabBarItem setImage:[[UIImage imageNamed:@"home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ];
    [homeVc.tabBarItem setSelectedImage:[[UIImage imageNamed:@"home_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    LXGNavigationController *NavHome = [[LXGNavigationController alloc]initWithRootViewController:homeVc];
    [self addChildViewController:NavHome];
    
    LXGBusinessViewController *BusinessVc = [[LXGBusinessViewController alloc]init];
    [BusinessVc.tabBarItem setImage:[[UIImage imageNamed:@"maps"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal]];
    [BusinessVc.tabBarItem setSelectedImage:[[UIImage imageNamed:@"maps_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ]];
    
    LXGNavigationController *NavBusiness = [[LXGNavigationController alloc]initWithRootViewController:BusinessVc];
    [self addChildViewController:NavBusiness];
    
}

@end
