//
//  UZMediatorManager+GuideActions.m
//  Pods
//
//  Created by leijian on 16/7/18.
//
//

#import "UZMediatorManager+Guide.h"
NSString * const kCTMediatorTargetGuide = @"Guide";
NSString * const kCTMediatorActionGuideController = @"pushToGuide";
@implementation UZMediatorManager (Guide)
- (UIViewController *)UZMediator_GuideVCWithIsFormPersonCenterPage:(BOOL)isFormPersonCenterPage withMessage:(void(^)(void))confirmAction
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:@{@"isFormPersonCenterPage" : @(isFormPersonCenterPage) ?: NO}];
    paramsToSend[@"confirmAction"] = confirmAction;
    UIViewController *vc = [self performTarget:kCTMediatorTargetGuide action:kCTMediatorActionGuideController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
@end
