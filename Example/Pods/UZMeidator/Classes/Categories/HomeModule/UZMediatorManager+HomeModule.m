//
//  UZMediatorManager+HomeModule.m
//  Pods
//
//  Created by 尹祥 on 16/7/29.
//
//

#import "UZMediatorManager+HomeModule.h"
NSString * const kUZMediatorTargetHomeVC = @"HomeModule";
NSString * const kUZMediatorActionHomeController = @"pushToHomeVC";
NSString * const kUZMediatorSearchController = @"pushSearchVC";
NSString * const kUZMediatorCityController = @"pushCityVC";
NSString * const kUZMediatorScaningController = @"pushScaningVC";
NSString * const kUZMediatorSignController = @"pushSignVC";
NSString * const kUZMediatorSignInfoController = @"pushSignInfoVC";
@implementation UZMediatorManager (HomeModule)
- (UIViewController *)UZMediator_HomeVCWithParams:(NSDictionary *)params withMessage:(void(^)(void))confirmAction;
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    paramsToSend[@"confirmAction"] = confirmAction;
    UIViewController *vc = [self performTarget:kUZMediatorTargetHomeVC action:kUZMediatorActionHomeController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}


/**
 * 配置搜索
 *
 *  @param params        参数
 *  @param confirmAction 回调
 *
 *  @return 返回当前的页面
 */
- (UIViewController *)UZMediator_SearchVCWithParams:(NSDictionary *)params withMessage:(void(^)(NSString *searchText))confirmAction;
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    paramsToSend[@"confirmAction"] = confirmAction;
    UIViewController *vc = [self performTarget:kUZMediatorTargetHomeVC action:kUZMediatorSearchController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

/**
 *  配置城市页面
 *
 *  @param confirmAction
 *
 *  @return
 */
- (UIViewController *)UZMediator_CityVCWithMessage:(void(^)(id obj))confirmAction;
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
    paramsToSend[@"confirmAction"] = confirmAction;
    UIViewController *vc = [self performTarget:kUZMediatorTargetHomeVC action:kUZMediatorCityController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

/**
 *  配置二维码扫描页面
 *
 *  @param confirmAction
 *
 *  @return
 */

- (UIViewController *)UZMediator_ScaningVC;
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
    UIViewController *vc = [self performTarget:kUZMediatorTargetHomeVC action:kUZMediatorScaningController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
/**
 *  签证页面
 *
 *  @param params        参数
 *  @param confirmAction 回调
 *
 *  @return
 */
- (UIViewController *)UZMediator_SignVC;
{
     NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
    UIViewController *vc = [self performTarget:kUZMediatorTargetHomeVC action:kUZMediatorSignController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

/**
 *  签证集合
 *
 *  @param visaCountryID 国家ID
 *  @param countryName   城市名称
 *
 *  @return
 */
- (UIViewController *)UZMediator_SignInfoVC:(NSString *)visaCountryID
                                countryName:(NSString *)countryName;
{
    NSDictionary *params=@{@"visaCountryID":visaCountryID,@"countryName":countryName};
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    UIViewController *vc = [self performTarget:kUZMediatorTargetHomeVC action:kUZMediatorSignInfoController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
@end
