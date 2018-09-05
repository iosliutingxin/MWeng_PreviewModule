//
//  UZMediator+ModuleSpecialActions.m
//  UzaiModuleApp
//
//  Created by leijian on 16/6/30.
//  Copyright © 2016年 Uzai. All rights reserved.
//

#import "UZMediatorManager+ModuleSpecialActions.h"

NSString * const kUZMediatorTargetSpecial = @"special";
NSString * const kUZMediatorActionPushToSpecialVC = @"pushToSpecial";
NSString *const kUZMediatorActionSelectSpecialVC = @"selectSpecial";

@implementation UZMediatorManager (ModuleSpecialActions)

- (UIViewController *)UZMediator_SpecialVCWithParams:(NSDictionary *)params
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    UIViewController *vc = [self performTarget:kUZMediatorTargetSpecial action:kUZMediatorActionPushToSpecialVC params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
-(void)UZMediator_SelectSpeciaVCWithProductType:(NSInteger)productType andChannel:(NSString *)channel
{
    NSDictionary *params = @{@"productType": @(productType),
                             @"channel": channel?:@""};
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    [self performTarget:kUZMediatorTargetSpecial action:kUZMediatorActionSelectSpecialVC params:paramsToSend];
}
@end
