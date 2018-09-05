//
//  UZMediatorManager+DestinationChannel.m
//  Pods
//
//  Created by weipeng on 16/8/2.
//
//

#import "UZMediatorManager+DestinationChannel.h"

NSString * const kCTMediatorTargetDestinationChannel = @"DestinationChannel";
NSString * const kCTMediatorActionDestinationChannelController = @"pushToDestinationChannel";
NSString * const kCTMediatorTargetAllDestinationChannel = @"AllDestinationChannel";
NSString * const kCTMediatorActionAllDestinationChannelController = @"pushToAllDestinationChannel";
@implementation UZMediatorManager (DestinationChannel)

- (UIViewController *)UZMediator_DestinationChannelVCWithFields3:(NSString *)fields3 WithFields2:(NSString *)fields2 WithNavLinkName:(NSString *)navLinkName withID:(NSString *)ID
{
    NSDictionary *params=@{@"Fields3":fields3,@"Fields2":fields2,@"NavLinkName":navLinkName,@"ID":ID};
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    UIViewController *vc = [self performTarget:kCTMediatorTargetDestinationChannel action:kCTMediatorActionDestinationChannelController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

- (UIViewController *)UZMediator_AllDestinationChannelVCWithFields3:(NSString *)fields3 WithNavLinkName:(NSString *)navLinkName withID:(NSString *)ID
{
    NSDictionary *params=@{@"Fields3":fields3,@"NavLinkName":navLinkName,@"ID":ID};
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    UIViewController *vc = [self performTarget:kCTMediatorTargetAllDestinationChannel action:kCTMediatorActionAllDestinationChannelController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
@end
