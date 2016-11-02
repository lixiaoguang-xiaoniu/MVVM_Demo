//
//  LXGBusinessViewController.m
//  MVVM_Demo
//
//  Created by LeeMichael on 8/4/16.
//  Copyright © 2016 xiaoniu. All rights reserved.
//

#import "LXGBusinessViewController.h"

@interface  LXGBusinessViewController()<UITableViewDataSource,UITableViewDelegate>
{
    NSIndexPath *indexPath;
}
/** table */
/** test string */
@property (nonatomic, strong) NSMutableString *myStr;
/** dic */
@property (nonatomic, strong) NSMutableDictionary<NSIndexPath*,NSNumber*> *testDict;

@end



@implementation LXGBusinessViewController

-(NSMutableDictionary *)testDict{
    if(!_testDict){
        _testDict = [NSMutableDictionary dictionary];
    }
    return _testDict;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
//    UILabel *label = [[UILabel alloc]init];
//    label.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:label];
//    label.layer.cornerRadius = 0.5;
//    _myStr = [NSMutableString stringWithString:@"my label"];
//    label.text = _myStr;
//    label.frame = CGRectMake(100, 100, 100, 100);
//    
//    label.clipsToBounds = YES;
//    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.backgroundColor = [UIColor grayColor];
//    [btn setTitle:@"要和角色" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    btn.frame = CGRectMake(100, 300, 100, 100);
//    [self.view addSubview:btn];
}

#pragma makr - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 20;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}



// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
//    NSLog(@"%@",[UIFont familyNames]);
    
    
////    [_myStr deleteCharactersInRange:NSMakeRange(0, _myStr.length)];
//    static NSInteger myNum = 0;
//    static NSInteger count = 0;
//    count ++;
//    NSInteger step = 1;
//    if(myNum>3){
//        step = -step;
//    }
////    mstr = [NSMutableString stringWithFormat:@"my-%zd",myNum++];
//    indexPath = [NSIndexPath indexPathForRow:myNum+=step inSection:0];
//    static NSIndexPath *staticPath;
//    NSIndexPath *newPath = [[NSIndexPath indexPathForRow:myNum inSection:0] copy];
//    staticPath = [newPath copy];
//    NSLog(@"%zd--myNum:%zd",self.testDict[indexPath].boolValue,myNum);
//    if(count<10){
//    self.testDict[indexPath] = [NSNumber numberWithInteger:myNum];
//    }
//    else{
//        self.testDict[newPath] = [NSNumber numberWithInteger:myNum];
//    }
//    
//    NSLog(@"%@\n>>normal%@\n>>new:%@\n>>static:%@",self.testDict,indexPath,newPath,staticPath);
}
@end
