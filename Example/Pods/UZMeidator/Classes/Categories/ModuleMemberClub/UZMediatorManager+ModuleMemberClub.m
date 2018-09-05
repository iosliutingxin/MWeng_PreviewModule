//
//  UZMediatorManager+ModuleMemberClub.m
//  Pods
//
//  Created by 尹祥 on 16/8/15.
//
//

#import "UZMediatorManager+ModuleMemberClub.h"
NSString * const kCTMediatorTargetModuleMemberClub = @"MemberClub";
NSString * const kCTMediatorActionModuleMemberClubController = @"initMemberClubVC";
@implementation UZMediatorManager (ModuleMemberClub)

- (UIViewController *)UZMediator_PushToMemberClub;
{
    UIViewController *vc = [self performTarget:kCTMediatorTargetModuleMemberClub action:kCTMediatorActionModuleMemberClubController params:nil];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    }else{
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
@end
