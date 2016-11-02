//
//  stepOneEntity.m
//  MVVM_Demo
//
//  Created by xiaoniu on 11/2/16.
//  Copyright © 2016 xiaoniu. All rights reserved.
//

#import "stepOneEntity.h"

@implementation stepOneEntity

- (NSString *)name{
    NSString *str = @"michael";
    unichar mycha = [str characterAtIndex:arc4random() % str.length];
    return [NSString stringWithCharacters: &mycha length:1];
}

@end
