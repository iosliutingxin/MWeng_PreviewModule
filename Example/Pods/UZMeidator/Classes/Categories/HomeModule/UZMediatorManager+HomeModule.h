//
//  UZMediatorManager+HomeModule.h
//  Pods
//
//  Created by 尹祥 on 16/7/29.
//
//

#import "UZMediatorManager.h"
#import <UIKit/UIKit.h>

@interface UZMediatorManager (HomeModule)
/**
 *  配置首页
 *
 *  @param params        参数
 *  @param confirmAction 回调
 *
 *  @return 首页vc的对象
 */
- (UIViewController *)UZMediator_HomeVCWithParams:(NSDictionary *)params withMessage:(void(^)(void))confirmAction;
/**
 * 配置搜索
 *
 *  @param params        参数
 *  @param confirmAction 回调
 *
 *  @return 返回当前的页面
 */
- (UIViewController *)UZMediator_SearchVCWithParams:(NSDictionary *)params withMessage:(void(^)(NSString *searchText))confirmAction;
/**
 *  配置城市页面
 *
 *  @param confirmAction
 *
 *  @return
 */
- (UIViewController *)UZMediator_CityVCWithMessage:(void(^)(id obj))confirmAction;

/**
 * 配置二维码扫描页面
 *
 *  @param confirmAction
 *
 *  @return
 */
- (UIViewController *)UZMediator_ScaningVC;

/**
 *  签证页面
 *
 *  @return
 */
- (UIViewController *)UZMediator_SignVC;

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
@end
