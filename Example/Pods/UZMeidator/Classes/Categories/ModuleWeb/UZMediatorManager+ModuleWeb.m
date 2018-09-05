//
//  UZMediatorManager+ModuleWeb.m
//  Pods
//
//  Created by 尹祥 on 16/8/10.
//
//

#import "UZMediatorManager+ModuleWeb.h"

NSString * const kUZMediatorTargetWebModule                 = @"WebModule";
NSString * const kUZMediatorActionPushToWebHomeActiveVC     = @"pushToWebHomeActiveVC";
NSString * const kUZMediatorActionPushToWebPlaceanOrderVC   = @"pushToWebPlaceanOrderVC";
NSString * const kUZMediatorActionPushToWebPayOrderVC       = @"pushToWebPayOrderVC";
NSString * const kUZMediatorActionPushToWebNewPayOrderVC    = @"pushToWebNewPayOrderVC";
NSString * const kUZMediatorActionPushToWebPactVC           = @"pushToWebPactVC";
NSString * const kUZMediatorActionPushToWebScaningVC        = @"pushToWebScaningVC";
NSString * const kUZMediatorActionPushToGiftcardPayVC       = @"pushToGiftcardPayVC";
@implementation UZMediatorManager (ModuleWeb)
/**
 *  活动页面
 *
 *  @param url           路径
 *  @param isShare       是否可以分享
 *  @param shareContent  分享的内容
 *  @param shareTitle    分享的title
 *  @param shareImage    分享的图片链接
 *  @param shareUrl      分享的路径
 *
 *  @return
 */
- (UIViewController *)UZMediator_webHomeActiveVC:(NSString *)infoStr
                                         isShare:(NSInteger)isShare
                                    shareContent:(NSString *)shareContent
                                      shareTitle:(NSString *)shareTitle
                                      shareImage:(NSString *)shareImage
                                        shareUrl:(NSString *)shareUrl {
    
    NSDictionary *params = @{@"infoStr": infoStr ?: @"" ,
                             @"isShare": @(isShare).stringValue,
                             @"shareContent": shareContent ?: @"",
                             @"shareTitle": shareTitle ?: @"",
                             @"shareImage": shareImage ?: @"",
                             @"shareUrl": shareUrl ?: @""};
    UIViewController *vc = [self performTarget:kUZMediatorTargetWebModule action:kUZMediatorActionPushToWebHomeActiveVC params:params];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

/**
 *  配置下单页面
 *
 *  @param params        参数
 *
 *  @return
 */
- (UIViewController *)UZMediator_webPlaceanOrderVC:(NSString *)infoStr
                                    isHiddenButton:(BOOL)isHiddenButton {
    NSDictionary *params = @{@"infoStr": infoStr ?: @"",
                             @"isHiddenButton": @(isHiddenButton)};
    UIViewController *vc = [self performTarget:kUZMediatorTargetWebModule action:kUZMediatorActionPushToWebPlaceanOrderVC params:params];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
/**
 *  配置支付页面页面
 *
 *  @param params        参数
 *
 *  @return
 */
- (UIViewController *)UZMediator_webPayOrderVC:(NSString *)infoStr
                                   htmlContent:(NSString *)htmlContent
                                   isLastOrder:(BOOL)isLastOrder {
    NSDictionary *params = @{@"infoStr": infoStr ?: @"",
                             @"htmlContent": htmlContent ?: @"",
                             @"isLastOrder": @(isLastOrder)};
    UIViewController *vc = [self performTarget:kUZMediatorTargetWebModule action:kUZMediatorActionPushToWebPayOrderVC params:params];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

/**
 *  550新版支付页面
 *
 *  @param params        参数
 *
 *  @return
 */
- (UIViewController *)UZMediator_webNewPayOrderVC:(NSString *)PayUrl htmlContent:(NSString *)htmlContent isLastOrder:(NSString *)isLastOrder mainOrderId:(NSString *) mainOrderId isFromOrderDetail:(NSString *)isFromOrderDetail{
    NSDictionary *params = @{@"PayUrl": PayUrl ?: @"",
                             @"htmlContent": htmlContent ?: @"",
                             @"isLastOrder": isLastOrder ?: @"",
                             @"mainOrderId": mainOrderId ?: @"",
                             @"isFromOrderDetail": isFromOrderDetail ?: @""
                             };
    UIViewController *vc = [self performTarget:kUZMediatorTargetWebModule action:kUZMediatorActionPushToWebNewPayOrderVC params:params];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
    
    
}


- (UIViewController *)UZMediator_webPactVC:(NSString *)infostr
                                 backBlock:(void (^)(void))backBlock {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"infostr": infostr ?: @""}];
    if (backBlock) {
        params[@"backBlock"] = backBlock;
    }
    UIViewController *vc = [self performTarget:kUZMediatorTargetWebModule action:kUZMediatorActionPushToWebPactVC params:[params copy]];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

- (UIViewController *)UZMediator_webScaningVC:(NSString *)infoStr {
    NSDictionary *params = @{@"infoStr": infoStr ?: @""};
    UIViewController *vc = [self performTarget:kUZMediatorTargetWebModule action:kUZMediatorActionPushToWebScaningVC params:params];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

- (UIViewController *)UZMediator_giftcardPayVC:(CGFloat)nRemainMoney
                                       orderID:(NSString *)orderID
                                    orderSonID:(NSString *)orderSonID
                                     payDriect:(BOOL)payDriect
                                   isLastOrder:(BOOL)isLastOrder {
    NSDictionary *params = @{@"nRemainMoney": @(nRemainMoney),
                             @"orderID": orderID ?: @"",
                             @"orderSonID": orderSonID ?: @"",
                             @"payDriect": @(payDriect),
                             @"isLastOrder": @(isLastOrder)};
    UIViewController *vc = [self performTarget:kUZMediatorTargetWebModule action:kUZMediatorActionPushToGiftcardPayVC params:params];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

@end
