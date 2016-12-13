//
//  nextViewController.h
//  MVVM_Demo
//
//  Created by xiaoniu on 11/8/16.
//  Copyright © 2016 xiaoniu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tradeProtocol.h"

@interface nextViewController : UIViewController
@property (nonatomic, strong) id<tradeProtocol> tradeEntity;

@end
