//
//  LXGUserEntity.h
//  MVVM_Demo
//
//  Created by xiaoniu on 12/13/16.
//  Copyright © 2016 xiaoniu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXGUserProtocol.h"
@interface LXGUserEntity : NSObject<LXGUserProtocol>
/** first name */
@property (nonatomic, copy) NSString *firstName;
@end
