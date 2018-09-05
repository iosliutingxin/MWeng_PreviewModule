//
//  UZMediatorManager+ProductDetailModule.m
//  Pods
//
//  Created by 尹祥 on 16/8/3.
//
//

#import "UZMediatorManager+ProductDetailModule.h"
NSString * const kUZMediatorTargetProductVC = @"ProductDetailModule";
NSString * const kUZMediatorActionProductInfoController = @"pushToProductInfoVC";
NSString * const kUZMediatorActionProductDetailController = @"pushToProductDetailVC";
NSString * const kUZMediatorActionProductCommendController = @"pushToProductCommendVC";
NSString * const kUZMediatorActionProductRouteController = @"pushToProductRouteVC";
NSString * const kUZMediatorActionProductFlightController = @"pushToFlightVC";
NSString * const kUZMediatorActionProductCalendarVCController = @"pushToCalendarVC";
NSString * const kUZMediatorActionProductSignVCController = @"pushToSignVC";
@implementation UZMediatorManager (ProductDetailModule)

/**
 *  产品详情
 *
 *  @param productId          产品ID
 *  @param uzaiProductClassId 产品的类型
 *
 *  @return
 */
- (UIViewController *)UZMediator_ProductInfoWithProductId:(NSString *)productId
                                       uzaiProductClassId:(NSString *)uzaiProductClassId;
{
    NSDictionary *params=@{@"productId":productId?productId:@"",@"uzaiProductClassId":uzaiProductClassId?uzaiProductClassId:@""};
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    UIViewController *vc = [self performTarget:kUZMediatorTargetProductVC action:kUZMediatorActionProductInfoController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

/**
 550改版详情
 
 @param productId          产品id
 @param uzaiProductClassId 产品的类型：跟团游
 
 @return
 */
- (UIViewController *)UZMediator_ProductDetailWithProductId:(NSString *)productId
                                         productType:(NSString *)productType{

    NSDictionary *params=@{@"productId":productId?productId:@"",@"productType":productType?productType:@""};
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    UIViewController *vc = [self performTarget:kUZMediatorTargetProductVC action:kUZMediatorActionProductDetailController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

/**
 *  配置产品评论页
 *
 *  @param params        参数（productId,uzaiProductClassId）
 *  @param confirmAction 回调
 *
 *  @return
 */
- (UIViewController *)UZMediator_ProductCommendVCWithProductId:(NSString *)productId
                                            uzaiProductClassId:(NSString *)uzaiProductClassId;
{
//    NSDictionary *params=@{@"productId":productId,@"uzaiProductClassId":uzaiProductClassId};
    NSDictionary *params=@{@"productId":productId?productId:@"",@"uzaiProductClassId":uzaiProductClassId?uzaiProductClassId:@""};
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    UIViewController *vc = [self performTarget:kUZMediatorTargetProductVC action:kUZMediatorActionProductCommendController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

/**
 *  行程列表
 *
 *  @param productId          产品的ID
 *  @param uzaiProductClassId 产品的类型
 *  @param routeDict          行程A集合
 *  @param groupId            分组的ID
 *
 *  @return
 */
- (UIViewController *)UZMediator_ProductRouteVCProductId:(NSString *)productId
                                      uzaiProductClassId:(NSString *)uzaiProductClassId
                                               routeDict:(NSDictionary *)routeDict
                                                 groupId:(NSString *)groupId
{
  NSDictionary *params=@{@"routeDict":routeDict?routeDict:@"",
                         @"groupId":groupId?groupId:@"",
                         @"productId":productId?productId:@"",
                         @"uzaiProductClassId":uzaiProductClassId==nil?@"":uzaiProductClassId};
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    UIViewController *vc = [self performTarget:kUZMediatorTargetProductVC action:kUZMediatorActionProductRouteController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

/**
 *  交通信息的集合
 *
 *  @param arrFlight 交通信息
 *
 *  @return
 */
- (UIViewController *)UZMediator_ProductFlightVCWitharrFlightList:(NSArray *)arrFlight;
{
    NSDictionary *params = @{@"arrFlight":arrFlight?arrFlight:@""};
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    UIViewController *vc = [self performTarget:kUZMediatorTargetProductVC action:kUZMediatorActionProductFlightController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
/**
 *  产品日历页面
 *
 *  @param routeSelectIndex   选择的行程（行程A，行程B）
 *  @param productInfo        产品详情
 *  @param productId          产品ID
 *  @param uzaiProductClassId 产品类型
 *
 *  @return
 */
- (UIViewController *)UZMediator_ProductCalendarVCWithRouteSelectIndex:(NSUInteger)routeSelectIndex
                                                           productInfo:(id)productInfo
                                                             ProductId:(NSString *)productId
                                                    uzaiProductClassId:(NSString *)uzaiProductClassId;
{
   
  NSDictionary *params= @{@"productId":productId?productId:@"",@"uzaiTravelClassID":uzaiProductClassId?uzaiProductClassId:@"",@"routeSelectIndex":@(routeSelectIndex).stringValue,@"productInfo":productInfo};
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    UIViewController *vc = [self performTarget:kUZMediatorTargetProductVC action:kUZMediatorActionProductCalendarVCController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

/**
 *  签证信息
 *
 *  @param productId          产品ID
 *  @param uzaiProductClassId 产品类型
 *  @param productInfo        产品详情对象
 *
 *  @return
 */
- (UIViewController *)UZMediator_ProductSignInfoWithProductId:(NSString *)productId
                                           uzaiProductClassId:(NSString *)uzaiProductClassId
                                                   productType:(NSString *)productType
{
  NSDictionary *params=@{@"productId":productId?productId:@"",@"uzaiProductClassId":uzaiProductClassId?uzaiProductClassId:@"",@"productType":productType?productType:@""};
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    UIViewController *vc = [self performTarget:kUZMediatorTargetProductVC action:kUZMediatorActionProductSignVCController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
@end
