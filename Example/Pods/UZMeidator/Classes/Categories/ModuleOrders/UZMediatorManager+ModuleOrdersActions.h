//
//  UZMediatorManager+ModuleOrdersActions.h
//  Pods
//
//  Created by Uzai-stoney on 16/8/4.
//
//

#import <UIKit/UIKit.h>
#import "UZMediatorManager.h"

@interface UZMediatorManager (ModuleOrdersActions)

/**
 *  订单列表
 *
 *  @param businessType 订单类型 0全部订单 1旅游度假 43当地玩乐
 *  @param stateType    订单状态 0全部 1待付款 4待出行 5待评价
 *  @param isOrderState 一般传nil 默认NO
 *
 */
- (UIViewController *)UZMediator_PushToOrdersVC:(NSInteger) businessType
                                           stateType:(NSInteger) stateType
                                        isOrderState:(NSNumber *) isOrderState;

/**
 *  Simply get ordersPageVC previous has problem
 *
 *  @param businessType 订单类型 0全部订单 1旅游度假 43当地玩乐
 *  @param stateType    订单状态 0全部 1待付款 4待出行 5待评价
 *  @param isOrderState 一般传nil 默认NO
 *
 */
- (UIViewController *)UZMediator_GetOrdersPageVC:(NSInteger) businessType
                                       stateType:(NSInteger) stateType
                                    isOrderState:(NSNumber *) isOrderState;


/**
 *  返回与刷新订单列表
 *
 *  @param currentNavController 当前UINavigationController
 *  @param isOrderState         不需要可传nil 默认NO
 *  @param isRefresh            是否刷新，不需要可传nil 默认NO
 *  @param animated             是否返回动画，不需要可传nil 默认YES
 *  @param isBack               是否返回，不需要可传nil 默认NO
 *
 *  @return 是否能找到订单列表
 */
- (BOOL)UZMediator_backOrRefreshOrdersVC:(UINavigationController *) currentNavController
                            isOrderState:(NSNumber *) isOrderState
                               isRefresh:(NSNumber *) isRefresh
                                animated:(NSNumber *) animated
                                  isBack:(NSNumber *) isBack;

/**
 *  返回拆单界面
 *
 *  @param currentNavController 当前UINavigationController
 *  @param animated             是否返回动画，不需要可传nil 默认YES
 */
- (void)UZMediator_backOrderSubListVC:(UINavigationController *)currentNavController
                             animated:(NSNumber *) animated;

- (UIViewController *)UZMediator_nativeFetchElectronicDocumentVC:(NSString *) orderId
                                                           phone:(NSString *) phone
                                                           email:(NSString *) email;

- (UIViewController *)UZMediator_nativeFetchOrderCommentDetailVC:(NSString *) orderId
                                                     productName:(NSString *) productName
                                                      productURL:(NSString *) productURL;

- (UIViewController *)UZMediator_nativeFetchOrderCommentVC:(NSString *) orderID
                                               productName:(NSString *) productName
                                                productURL:(NSString *) productURL
                                          commentFinsished:(void (^)(void)) commentFinsished;

- (UIViewController *)UZMediator_nativeFetchOrderDetailsPageVC:(NSString *) orderId
                                                       classId:(NSString *) classId;

- (UIViewController *)UZMediator_nativeFetchOrderSubListVC:(NSString *) productID
                                              supplierFlag:(NSString *) supplierFlag
                                              payUrl:(NSString *) payUrl
                                              orderSonList:(NSArray *) orderSonList
                                                  isYoulun:(BOOL) isYoulun;

@end
