//
//  LXGBusinessVM.m
//  MVVM_Demo
//
//  Created by xiaoniu on 12/13/16.
//  Copyright © 2016 xiaoniu. All rights reserved.
//

#import "LXGBusinessVM.h"

@interface LXGBusinessVM ()

/** userArr */
@property (nonatomic, copy) NSArray<id<LXGUserProtocol>>* userArr;

@end

@implementation LXGBusinessVM

- (instancetype)initWithUserArr:(NSArray <id<LXGUserProtocol>> *)arr {
    self = [super init];
    if (self) {
        self.userArr = arr;
    }
    
    return self;
}

- (void) setArr:(NSArray <id<LXGUserProtocol>> *)arr {
    self.userArr = arr;
}

@end
