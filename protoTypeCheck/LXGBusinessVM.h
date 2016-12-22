//
//  LXGBusinessVM.h
//  MVVM_Demo
//
//  Created by xiaoniu on 12/13/16.
//  Copyright © 2016 xiaoniu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXGUserEntity.h"

@interface LXGBusinessVM : NSObject
@property (nonatomic, copy, readonly) NSArray<id<LXGUserProtocol>>* userArr;
- (instancetype)initWithUserArr:(NSArray <id<LXGUserProtocol>> *)arr;
- (void) setArr:(NSArray <id<LXGUserProtocol>> *)arr;
@end
