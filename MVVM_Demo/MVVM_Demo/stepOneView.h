//
//  stepOneView.h
//  MVVM_Demo
//
//  Created by xiaoniu on 11/2/16.
//  Copyright © 2016 xiaoniu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tradeProtocol.h"
@interface stepOneView : UIView

@property (nonatomic, strong) UILabel *nameLabel;
- (void)showViewWithTadeInfo:(id<tradeProtocol>)tradeInfo;
@end
