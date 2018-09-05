//
//  UZMediatorManager+ProductDetailModule.h
//  Pods
//
//  Created by 尹祥 on 16/8/3.
//
//

#import "UZMediatorManager.h"

@interface UZMediatorManager (ProductDetailModule)
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


/**
 550改版详情

 @param productId          产品id
 @param uzaiProductClassId 产品的类型：跟团游  该字段暂时没有用上

 @return
 */
- (UIViewController *)UZMediator_ProductDetailWithProductId:(NSString *)productId
                                       productType:(NSString *)productType;

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
                                                 groupId:(NSString *)groupId;


/**
 *  交通信息的集合
 *
 *  @param arrFlight 交通信息
 *
 *  @return
 */
- (UIViewController *)UZMediator_ProductFlightVCWitharrFlightList:(NSArray *)arrFlight;




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
                                                  productType:(NSString *)productType;

@end
