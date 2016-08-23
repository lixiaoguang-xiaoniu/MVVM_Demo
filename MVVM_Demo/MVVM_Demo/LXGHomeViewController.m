//
//  LXGHomeViewController.m
//  MVVM_Demo
//
//  Created by LeeMichael on 8/4/16.
//  Copyright © 2016 xiaoniu. All rights reserved.
//

#import "LXGHomeViewController.h"

@interface LXGHomeViewController()<UITextFieldDelegate>

{
    UITextField *textField;
}
@end
@implementation LXGHomeViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    textField = [[UITextField alloc]init];
//    textField.frame = CGRectMake(10, 100, 300, 60);
//    textField.backgroundColor = [UIColor grayColor];
//    textField.delegate = self;
//    [self.view addSubview:textField];
//    
//    [textField addTarget:self action:@selector(verifyText:) forControlEvents:UIControlEventEditingChanged];
    
    self.view.frame = CGRectMake(0,0, 414, 736);
    [self.view addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld | NSKeyValueObservingOptionInitial context:@"xxx"];
    self.view.backgroundColor = [UIColor redColor];
//    UITableView *tb = [[UITableView alloc]init];
//    tb.frame = self.view.bounds;
//    [self.view addSubview:tb];
    
}
//-(void)loadViewIfRequired{
//    
//    NSLog(@"i'm coming");
//}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSLog(@"%@",change);
    NSLog(@"jskdjdl");
}

-(void)setView:(UIView *)view{
    [super setView:view];
//    self.view.frame = CGRectMake(200, 200, 200, 200);
 
}

//-(void)loadView{
//    [super loadView];
////    self.view.frame = CGRectMake(200, 200, 200, 200);
// 
//}


//-(void)viewDidLayoutSubviews{
////       self.view.frame = CGRectMake(200, 200, 200, 200); 
//}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    static NSInteger kkk = 1;
    kkk = -kkk;
    if(kkk>0){
    [textField removeTarget:nil action:nil forControlEvents:UIControlEventEditingChanged];
        [textField addTarget:self action:@selector(say:) forControlEvents:UIControlEventEditingChanged];
    }
    else{
    [textField removeTarget:nil action:nil forControlEvents:UIControlEventEditingChanged];
    [textField addTarget:self action:@selector(bark:) forControlEvents:UIControlEventEditingChanged];
    }


}

-(void)say:(UITextField *)textfieldlocal{
    NSLog(@"hello");
}
- (void)bark:(UITextField *)textfieldlocal{
    NSLog(@"bark。。。");
}
-(void)verifyText:(UITextField *)textFieldlocal{
    
    NSLog(@"%@",textFieldlocal.text);
    NSLog(@"%zd",[self caculateCountWithText:textFieldlocal.text]);
}

- (NSInteger)caculateCountWithText:(NSString *)text
{
    NSInteger length = 0;
    
    char *p = (char *)[text cStringUsingEncoding:NSUnicodeStringEncoding];
    
    for (NSInteger i = 0; i < [text lengthOfBytesUsingEncoding:NSUnicodeStringEncoding]; i++) {
        if (*p) {
            p++;
            length++;
        }
        else {
            p++;
        }
        
    }
    return length;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
//    if((textField.text.length > 5) && ![string isEqualToString:@""]){
//        return  NO;
//    }
    
    return YES;

}

#pragma mark - UITableViewDataSource

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 20;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"hhh"];
//    return cell;
//}

@end
