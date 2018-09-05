//
//  UZMediatorManager+DingZhiYou.m
//  Pods
//
//  Created by 于迪 on 16/8/13.
//
//

#import "UZMediatorManager+DingZhiYou.h"

NSString * const kUZMediatorTargetDingZhiYou                = @"DingZhiYouModule";
NSString * const kUZMediatorActionInitDingZhiYou            = @"NativeDingZhiYou";

@implementation UZMediatorManager (DingZhiYou)

/**
 *  进入定制游首页
 */
- (UIViewController *)UZMediator_dingZhiYouVC:(NSString *)webUrl;
{
    NSDictionary *params = @{@"webUrl":webUrl};
    UIViewController *vc = [self performTarget:kUZMediatorTargetDingZhiYou action:kUZMediatorActionInitDingZhiYou params:params];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    }else{
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

@end
