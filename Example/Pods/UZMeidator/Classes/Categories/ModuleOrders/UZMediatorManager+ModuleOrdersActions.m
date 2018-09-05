//
//  UZMediatorManager+ModuleOrdersActions.m
//  Pods
//
//  Created by Uzai-stoney on 16/8/4.
//
//

#import "UZMediatorManager+ModuleOrdersActions.h"

NSString * const kUZMediatorTargetOrders                            = @"Orders";
NSString * const kUZMediatorActionNativeFetchOrdersVC               = @"nativeFetchOrdersVC";
NSString * const kUZMediatorActionBackOrRefreshOrdersVC             = @"backOrRefreshOrdersVC";
NSString * const kUZMediatorActionBackOrderSubListVC                = @"backOrderSubListVC";
NSString * const kUZMediatorActionNativeFetchOrdersPageVC           = @"nativeFetchOrdersPageVC";

NSString * const kUZMediatorActionNativeFetchOrderCommentVC         = @"nativeFetchOrderCommentVC";
NSString * const kUZMediatorActionNativeFetchOrderSubListVC         = @"nativeFetchOrderSubListVC";
NSString * const kUZMediatorActionNativeFetchOrderDetailsPageVC     = @"nativeFetchOrderDetailsPageVC";
NSString * const kUZMediatorActionNativeFetchOrderCommentDetailVC   = @"nativeFetchOrderCommentDetailVC";
NSString * const kUZMediatorActionNativeFetchElectronicDocumentVC   = @"nativeFetchElectronicDocumentVC";

@implementation UZMediatorManager (ModuleOrdersActions)

- (UIViewController *)UZMediator_PushToOrdersVC:(NSInteger) businessType
                                           stateType:(NSInteger) stateType
                                        isOrderState:(NSNumber *) isOrderState {
    
    UIViewController *vc = [self performTarget:kUZMediatorTargetOrders
                                        action:kUZMediatorActionNativeFetchOrdersVC
                                        params:@{@"businessType": @(businessType),
                                                 @"stateType": @(stateType),
                                                 @"isOrderState": isOrderState ?: @NO}];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

//xyx获取orderpagevc
- (UIViewController *)UZMediator_GetOrdersPageVC:(NSInteger) businessType
                                       stateType:(NSInteger) stateType
                                    isOrderState:(NSNumber *) isOrderState {
    
    UIViewController *vc = [self performTarget:kUZMediatorTargetOrders
                                        action:kUZMediatorActionNativeFetchOrdersPageVC
                                        params:@{@"businessType": @(businessType),
                                                 @"stateType": @(stateType),
                                                 @"isOrderState": isOrderState ?: @NO}];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

- (BOOL)UZMediator_backOrRefreshOrdersVC:(UINavigationController *) currentNavController
                            isOrderState:(NSNumber *) isOrderState
                               isRefresh:(NSNumber *) isRefresh
                                animated:(NSNumber *) animated
                                  isBack:(NSNumber *) isBack {
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"isBack": isBack ?: @NO,
                                                                                  @"isRefresh": isRefresh ?: @NO,
                                                                                  @"animated": animated ?: @YES}];
    if (currentNavController) {
        params[@"currentNavController"] = currentNavController;
    }
    
    if (isOrderState) {
        params[@"isOrderState"] = isOrderState;
    }
    return [[self performTarget:kUZMediatorTargetOrders
                        action:kUZMediatorActionBackOrRefreshOrdersVC
                        params:[params copy]] boolValue];
}

- (void)UZMediator_backOrderSubListVC:(UINavigationController *)currentNavController
                             animated:(NSNumber *)animated {
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"animated": animated ?: @YES}];
    if (currentNavController) {
        params[@"currentNavController"] = currentNavController;
    }
    [self performTarget:kUZMediatorTargetOrders
                  action:kUZMediatorActionBackOrderSubListVC
                 params:[params copy]];
}

- (UIViewController *)UZMediator_nativeFetchElectronicDocumentVC:(NSString *) orderId
                                                           phone:(NSString *) phone
                                                           email:(NSString *) email {
    
    NSDictionary *params = @{@"orderId": orderId ?: @"",
                             @"phone": phone ?: @"",
                             @"email": email ?: @""};
    
    UIViewController *vc = [self performTarget:kUZMediatorTargetOrders action:kUZMediatorActionNativeFetchElectronicDocumentVC params:params];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

- (UIViewController *)UZMediator_nativeFetchOrderCommentDetailVC:(NSString *) orderId
                                                     productName:(NSString *) productName
                                                      productURL:(NSString *) productURL {
    NSDictionary *params = @{@"orderId": orderId ?: @"",
                             @"productName": productName ?: @"",
                             @"productURL": productURL ?: @""};
    
    UIViewController *vc = [self performTarget:kUZMediatorTargetOrders action:kUZMediatorActionNativeFetchOrderCommentDetailVC params:params];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

- (UIViewController *)UZMediator_nativeFetchOrderCommentVC:(NSString *) orderId
                                               productName:(NSString *) productName
                                                productURL:(NSString *) productURL
                                          commentFinsished:(void (^)(void)) commentFinsished {
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"orderId": orderId ?: @"",
                                                                                  @"productName": productName ?: @"",
                                                                                  @"productURL": productURL ?: @""}];
    if (commentFinsished) {
        params[@"commentFinsished"] = commentFinsished;
    }
    
    UIViewController *vc = [self performTarget:kUZMediatorTargetOrders action:kUZMediatorActionNativeFetchOrderCommentVC params:[params copy]];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

- (UIViewController *)UZMediator_nativeFetchOrderDetailsPageVC:(NSString *) orderId
                                                       classId:(NSString *) classId {
    
    NSDictionary *params = @{@"orderId": orderId ?: @"",
                             @"classId": classId ?: @""};
    UIViewController *vc = [self performTarget:kUZMediatorTargetOrders action:kUZMediatorActionNativeFetchOrderDetailsPageVC params:params];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

- (UIViewController *)UZMediator_nativeFetchOrderSubListVC:(NSString *) productID
                                              supplierFlag:(NSString *)supplierFlag
                                                    payUrl:(NSString *) payUrl
                                              orderSonList:(NSArray *) orderSonList
                                                  isYoulun:(BOOL) isYoulun {
    NSDictionary *params = @{@"productID": productID ?: @"",
                             @"orderSonList": orderSonList ?: @[],
                             @"supplierFlag": supplierFlag ?: @"",
                             @"payUrl": payUrl ?: @"",
                             @"isYoulun": @(isYoulun)};
    UIViewController *vc = [self performTarget:kUZMediatorTargetOrders action:kUZMediatorActionNativeFetchOrderSubListVC params:params];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
@end
