//
//  UZMediatorManager+Discovery.h
//  Pods
//
//  Created by 于迪 on 16/8/13.
//
//

#import "UZMediatorManager.h"

@interface UZMediatorManager (Discovery)

/**
 *  进入发现首页
 */

- (UIViewController *)UZMediator_discoveryVC;

/**
 *  进入发现详情页
 *  params 中有如下几个参数
 -  parameter detailUrl:   详情页的url（详情页为混合页面或者url链接）
 -  parameter productId:   详情页产品Id
 -  parameter subjectType: 详情页类型：1.详情 2.活动 3.外部链接（外部链接时使用系统导航栏）
 -  parameter title:       详情页导航栏标题
 *  @return UZDiscoveryDetailVC类型的视图控制器
 */
-(UIViewController *)UZMediator_discoveryDetailVC:(NSString *)detailUrl productId:(NSString *)productId subjectType:(NSString *)subjectType title:(NSString *)title;


@end
