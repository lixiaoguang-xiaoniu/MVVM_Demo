//
//  ProtocolTestViewController.m
//  MVVM_Demo
//
//  Created by xiaoniu on 11/2/16.
//  Copyright © 2016 xiaoniu. All rights reserved.
//

#import "ProtocolTestViewController.h"
#import "stepOneEntity.h"
#import "stepOneView.h"

@interface ProtocolTestViewController ()
/** label */
@property (nonatomic, strong) stepOneView *testView;
@end

@implementation ProtocolTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.testView = [[stepOneView alloc] initWithFrame:CGRectMake(50, 100, 150, 50)];
    [self.view addSubview:self.testView];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    stepOneEntity *entity = [[stepOneEntity alloc] init];
//    [self.testView showViewWithTadeInfo:entity];
    
}


@end
