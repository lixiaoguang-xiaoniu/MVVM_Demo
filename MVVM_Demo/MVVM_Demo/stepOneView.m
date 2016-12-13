//
//  stepOneView.m
//  MVVM_Demo
//
//  Created by xiaoniu on 11/2/16.
//  Copyright © 2016 xiaoniu. All rights reserved.
//

#import "stepOneView.h"

@implementation stepOneView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        self.nameLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.nameLabel.backgroundColor = [UIColor greenColor];
        self.nameLabel.font = [UIFont systemFontOfSize:28];
        self.nameLabel.textColor = [UIColor redColor];
        [self addSubview:self.nameLabel];
    };
    return  self;
}
- (void)showViewWithTadeInfo:(id<tradeProtocol>)tradeInfo {
    
    self.tradeEntity = tradeInfo;
}

@end
