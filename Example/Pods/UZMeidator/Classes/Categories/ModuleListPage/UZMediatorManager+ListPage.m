//
//  UZMediatorManager+ListPage.m
//  Pods
//
//  Created by leijian on 16/8/2.
//
//

#import "UZMediatorManager+ListPage.h"

NSString * const kUZMediatorTargetListPage = @"listPage";
NSString * const kUZMediatorActionPushToListPageVC = @"pushToListPage";

@implementation UZMediatorManager (ListPage)
- (UIViewController *)UZMediator_ListPageVCWithParams:(NSDictionary *)params
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    UIViewController *vc = [self performTarget:kUZMediatorTargetListPage action:kUZMediatorActionPushToListPageVC params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

- (UIViewController *)UZMediator_ListPageVCWithDestination:(NSString *)destination
{
    NSDictionary *params = @{@"destination": destination?:@""};
    return [self UZMediator_ListPageVCWithParams:params];
}

- (UIViewController *)UZMediator_ListPageVCWithTravelClassID:(NSString *)travelClassID
{
    NSDictionary *params = @{@"travelClassID": travelClassID?:@"",@"isShowDestination":@(YES)};
    return [self UZMediator_ListPageVCWithParams:params];
}

- (UIViewController *)UZMediator_ListPageVCWithDestination:(NSString *)destination andIsFromSearchVC:(BOOL)isFromSearchVC
{
    NSDictionary *params = @{@"destination": destination?:@"",
                             @"isFromSearchVC":@(isFromSearchVC)};
    return [self UZMediator_ListPageVCWithParams:params];
}

- (UIViewController *)UZMediator_ListPageVCWithTravelClassID:(NSString *)travelClassID
                                              andDestination:(NSString *)destination
                                            andSearchKeyword:(NSString *)searchKeyword
                                        andIsShowDestination:(BOOL)isShowDestination
                                         andPreDestinationID:(NSString *)preDestinationID
                                           andPreDestination:(NSString *)preDestination
                              andpreDestinationSearchKeyword:(NSString *)preDestinationSearchKeyword
{
    NSDictionary *params = @{@"travelClassID": travelClassID?:@"",
                             @"destination": destination?:@"",
                             @"isShowDestination":@(isShowDestination),
                             @"preDestination":preDestination?:@"",
                             @"searchKeyword":searchKeyword?:@"",
                             @"preDestinationID":preDestinationID?:@"",
                             @"preDestinationSearchKeyword":preDestinationSearchKeyword?:@""};
    return [self UZMediator_ListPageVCWithParams:params];
}
- (UIViewController *)UZMediator_ListPageVCWithTravelClassID:(NSString *)travelClassID
                                              andDestination:(NSString *)destination
                                               andDayRangeID:(NSUInteger)dayRangeID
                                                  andOrderBy:(NSUInteger)orderBy
                                                  andDiamond:(NSUInteger)diamond
                                             andPriceRangeID:(NSUInteger)priceRangeID
{
    NSDictionary *params = @{@"travelClassID": travelClassID?:@"",
                             @"destination": destination?:@"",
                             @"dayRangeID":@(dayRangeID),
                             @"orderBy":@(orderBy),
                             @"diamond":@(diamond),
                             @"priceRangeID":@(priceRangeID)};
    return [self UZMediator_ListPageVCWithParams:params];
}
@end
