//
//  UZMediatorManager+ListPage.h
//  Pods
//
//  Created by leijian on 16/8/2.
//
//

#import "UZMediatorManager.h"

@interface UZMediatorManager (ListPage)

/**
 *  列表页（简单版，非搜索页调用）
 *
 *  @param destination
 *
 *  @return
 */
- (UIViewController *)UZMediator_ListPageVCWithDestination:(NSString *)destination;


/**
 *  列表页（简单版，搜索页调用）
 *
 *  @param destination
 *  @param isFromSearchVC
 *
 *  @return
 */
- (UIViewController *)UZMediator_ListPageVCWithDestination:(NSString *)destination
                                           andIsFromSearchVC:(BOOL)isFromSearchVC;

/**
 *  列表页（简单版，邮轮调用）
 *
 *  @param travelClassID
 *
 *  @return
 */
- (UIViewController *)UZMediator_ListPageVCWithTravelClassID:(NSString *)travelClassID;

/**
 *  列表页（复杂版，全参数）
 *
 *  @param travelClassID
 *  @param destination
 *  @param searchKeyword
 *  @param isShowDestination
 *  @param preDestinationID
 *  @param preDestination
 *  @param preDestinationSearchKeyword
 *
 *  @return
 */
- (UIViewController *)UZMediator_ListPageVCWithTravelClassID:(NSString *)travelClassID
                                              andDestination:(NSString *)destination
                                            andSearchKeyword:(NSString *)searchKeyword
                                        andIsShowDestination:(BOOL)isShowDestination
                                         andPreDestinationID:(NSString *)preDestinationID
                                           andPreDestination:(NSString *)preDestination
                              andpreDestinationSearchKeyword:(NSString *)preDestinationSearchKeyword;

/**
 *  列表页 （搜索条件，发现 调用）
 *
 *  @param travelClassID
 *  @param destination
 *  @param dayRangeID
 *  @param orderBy
 *  @param diamond
 *  @param priceRangeID
 *
 *  @return
 */
- (UIViewController *)UZMediator_ListPageVCWithTravelClassID:(NSString *)travelClassID
                                              andDestination:(NSString *)destination
                                               andDayRangeID:(NSUInteger)dayRangeID
                                                andOrderBy:(NSUInteger)orderBy
                                                andDiamond:(NSUInteger)diamond
                                             andPriceRangeID:(NSUInteger)priceRangeID;
@end