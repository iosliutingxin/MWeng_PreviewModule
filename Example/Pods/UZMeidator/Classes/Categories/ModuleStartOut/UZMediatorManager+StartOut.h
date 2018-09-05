//
//  UZMediatorManager+StartOut.h
//  Pods
//
//  Created by Uzai-stoney on 16/8/1.
//
//

#import <UIKit/UIKit.h>
#import "UZMediatorManager.h"

@interface UZMediatorManager (StartOut)

/**
 *  度周末
 *
 */
- (UIViewController *)UZMediator_spendWeekendVC;

/**
 *  选中度周末视图
 *
 */
-(void)UZMediator_selectedSpendWeekendVC;
- (BOOL)UZMediator_backStartOutProductDetailVC:(UIViewController *) currentController;

- (UIViewController *)UZMediator_nativeFetchStartOutListPageVC:(NSString *) destination
                                                      isSearch:(BOOL) isSearch
                                                       orderBy:(NSInteger) orderBy;
- (UIViewController *)UZMediator_nativeFetchStartOutSearchVC:(void (^)(NSString *)) successBlock
                                                 failureBlock:(void (^)(void)) failureBlock;

/**
 *  controller.productId = params[@"productId"];
 *  NSDictionary *receivePreData = params[@"receivePreData"];
 *  if (receivePreData && receivePreData.count) {
 *  UZToStartCarlenderType selectType = [receivePreData[@"selectType"] integerValue];
 *  UZDateModel *selectModel = receivePreData[@"selectModel"];
 *  NSArray *subProduct = receivePreData[@"subProduct"];
 *  UZDateModel *startDate = receivePreData[@"startDate"];
 *  UZDateModel *endDate = receivePreData[@"endDate"];
 *  NSInteger baseNumber = [receivePreData[@"baseNumber"] integerValue];
 *  NSString *minNight = receivePreData[@"minNight"];
 *  NSString *maxNight = receivePreData[@"maxNight"];
 *  NSInteger type = [receivePreData[@"type"] integerValue];
 */
- (UIViewController *)UZMediator_nativeFetchStartOutCalendarVC:(NSDictionary *) params
                                                         block:(void (^)(id)) choiceDateBlock;
- (UIViewController *)UZMediator_nativeFetchStartOutProductDetailVC:(NSString *) poiIdStr;

/**
 *  支付订单页面
 */
- (UIViewController *)UZMediator_nativeFetchStartOutProductOrderVC:(NSString *) poiID
                                                           poiName:(NSString *) poiName
                                                         productId:(NSString *) productId
                                                       productName:(NSString *) productName
                                                      productPrice:(NSString *) productPrice
                                                        refundNote:(NSString *) refundNote;

- (UIViewController *)UZMediator_nativeFetchStartOutProductPayOrderVC:(NSString *) refundNote
                                                            partnerId:(NSString *) partnerId
                                                      orderDetailList:(NSDictionary <NSString *, id> *) orderDetailList
                                                       isOrderDetails:(BOOL) isOrderDetails;

- (UIViewController *)UZMediator_nativeFetchStartOutPayStateVC:(NSString *) partnerId
                                               orderDetailList:(NSDictionary <NSString *, id> *) orderDetailList
                                                isOrderDetails:(BOOL) isOrderDetails;

@end
