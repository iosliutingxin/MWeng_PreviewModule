//
//  UZMediatorManager+StartOut.m
//  Pods
//
//  Created by Uzai-stoney on 16/8/1.
//
//

#import "UZMediatorManager+StartOut.h"

NSString * const kUZMediatorTargetStartOut                          = @"StartOut";
NSString * const kUZMediatorActionInitSpendWeekendVC                = @"initStartOutHomeVC";
NSString * const kUZMediatorActionSelectedSpendWeekendVC            = @"selectedStartOutHomeVC";
NSString * const kUZMediatorActionBackStartOutProductDetailVC            = @"backStartOutProductDetailVC";
NSString * const kUZMediatorActionNativeFetchStartOutSearchVC            = @"nativeFetchStartOutSearchVC";
NSString * const kUZMediatorActionNativeFetchStartOutCalendarVC          = @"nativeFetchStartOutCalendarVC";
NSString * const kUZMediatorActionNativeFetchStartOutListPageVC          = @"nativeFetchStartOutListPageVC";
NSString * const kUZMediatorActionNativeFetchStartOutPayStateVC          = @"nativeFetchStartOutPayStateVC";
NSString * const kUZMediatorActionNativeFetchStartOutProductOrderVC      = @"nativeFetchStartOutProductOrderVC";
NSString * const kUZMediatorActionNativeFetchStartOutProductDetailVC     = @"nativeFetchStartOutProductDetailVC";
NSString * const kUZMediatorActionNativeFetchStartOutProductPayOrderVC   = @"nativeFetchStartOutProductPayOrderVC";

@implementation UZMediatorManager (StartOut)

- (UIViewController *)UZMediator_spendWeekendVC {
    UIViewController *vc = [self performTarget:kUZMediatorTargetStartOut action:kUZMediatorActionInitSpendWeekendVC params:nil];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

- (void)UZMediator_selectedSpendWeekendVC {
    [self performTarget:kUZMediatorTargetStartOut action:kUZMediatorActionSelectedSpendWeekendVC params:nil];
}

- (BOOL)UZMediator_backStartOutProductDetailVC:(UIViewController *)currentController {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (currentController) {
        params[@"currentController"] = currentController;
    }
    
    return [[self performTarget:kUZMediatorTargetStartOut
                         action:kUZMediatorActionBackStartOutProductDetailVC
                         params:[params copy]] boolValue];
}

- (UIViewController *)UZMediator_nativeFetchStartOutSearchVC:(void (^)(NSString *))successBlock failureBlock:(void (^)(void))failureBlock {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (successBlock) {
        params[@"successBlock"] = successBlock;
    }
    
    if (failureBlock) {
        params[@"failureBlock"] = failureBlock;
    }
    
    UIViewController *vc = [self performTarget:kUZMediatorTargetStartOut action:kUZMediatorActionNativeFetchStartOutSearchVC params:[params copy]];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

- (UIViewController *)UZMediator_nativeFetchStartOutCalendarVC:(NSDictionary *)params block:(void (^)(id))choiceDateBlock {
    
    NSMutableDictionary *newParams = [NSMutableDictionary dictionaryWithDictionary:params];
    
    if (choiceDateBlock) {
        newParams[@"choiceDateBlock"] = choiceDateBlock;
    }
    
    UIViewController *vc = [self performTarget:kUZMediatorTargetStartOut action:kUZMediatorActionNativeFetchStartOutCalendarVC params:[newParams copy]];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

- (UIViewController *)UZMediator_nativeFetchStartOutListPageVC:(NSString *)destination
                                                      isSearch:(BOOL)isSearch
                                                       orderBy:(NSInteger)orderBy {
    NSDictionary *params = @{@"destination": destination ?: @"",
                             @"isSearch": @(isSearch),
                             @"orderBy": @(orderBy)};
    UIViewController *vc = [self performTarget:kUZMediatorTargetStartOut action:kUZMediatorActionNativeFetchStartOutListPageVC params:params];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

- (UIViewController *)UZMediator_nativeFetchStartOutPayStateVC:(NSString *)partnerId
                                               orderDetailList:(NSDictionary<NSString *,id> *)orderDetailList
                                                isOrderDetails:(BOOL)isOrderDetails {
    NSDictionary *params = @{@"partnerId": partnerId ?: @"",
                             @"orderDetailList": orderDetailList ?: @{},
                             @"isOrderDetails": @(isOrderDetails)};
    
    UIViewController *vc = [self performTarget:kUZMediatorTargetStartOut action:kUZMediatorActionNativeFetchStartOutPayStateVC params:params];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

- (UIViewController *)UZMediator_nativeFetchStartOutProductOrderVC:(NSString *)poiID
                                                           poiName:(NSString *)poiName
                                                         productId:(NSString *)productId
                                                       productName:(NSString *)productName
                                                      productPrice:(NSString *)productPrice
                                                        refundNote:(NSString *)refundNote {
    NSDictionary *params = @{@"poiID": poiID ?: @"",
                             @"poiName": poiName ?: @"",
                             @"productId": productId ?: @"",
                             @"productPrice": productPrice ?: @"0.0",
                             @"productName": productName ?: @"",
                             @"refundNote": refundNote ?: @""};
    UIViewController *vc = [self performTarget:kUZMediatorTargetStartOut action:kUZMediatorActionNativeFetchStartOutProductOrderVC params:params];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

- (UIViewController *)UZMediator_nativeFetchStartOutProductDetailVC:(NSString *)poiIdStr {
    UIViewController *vc = [self performTarget:kUZMediatorTargetStartOut action:kUZMediatorActionNativeFetchStartOutProductDetailVC params:@{@"poiIdStr": poiIdStr ?: @""}];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

- (UIViewController *)UZMediator_nativeFetchStartOutProductPayOrderVC:(NSString *)refundNote
                                                            partnerId:(NSString *)partnerId
                                                      orderDetailList:(NSDictionary<NSString *,id> *)orderDetailList
                                                       isOrderDetails:(BOOL)isOrderDetails {
    NSDictionary *params = @{@"refundNote": refundNote ?: @"",
                             @"partnerId": partnerId ?: @"",
                             @"orderDetailList": orderDetailList ?: @{},
                             @"isOrderDetails": @(isOrderDetails)};
    
    UIViewController *vc = [self performTarget:kUZMediatorTargetStartOut action:kUZMediatorActionNativeFetchStartOutProductPayOrderVC params:params];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

@end
