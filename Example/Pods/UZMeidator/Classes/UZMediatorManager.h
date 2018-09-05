//
//  UZMediator.h
//  UzaiModuleApp
//
//  Created by leijian on 16/6/30.
//  Copyright © 2016年 Uzai. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^UZUrlRouterCallbackBlock)(void);
@interface UZMediatorManager : NSObject
+ (instancetype)sharedInstance;

// 远程App调用入口
- (id)performActionWithUrl:(NSURL *)url completion:(void(^)(NSDictionary *info))completion;
// 本地组件调用入口
- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params;
@end
