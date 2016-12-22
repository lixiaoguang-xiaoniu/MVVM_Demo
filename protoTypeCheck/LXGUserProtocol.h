//
//  LXGUserProtocol.h
//  
//
//  Created by xiaoniu on 12/13/16.
//
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@protocol LXGUserProtocol <NSObject>
/** name */
@property (nonatomic, copy, readonly) NSString *name;
@end
NS_ASSUME_NONNULL_END
