//
//  UZMediatorManager+ModuleWeb.h
//  Pods
//
//  Created by 尹祥 on 16/8/10.
//
//

#import "UZMediatorManager.h"

@interface UZMediatorManager (ModuleWeb)
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
                                        shareUrl:(NSString *)shareUrl;

/**
 *  配置下单页面
 *
 *  @param params        参数
 *
 *  @return
 */
- (UIViewController *)UZMediator_webPlaceanOrderVC:(NSString *)infoStr
                                    isHiddenButton:(BOOL) isHiddenButton;

/**
 *  配置支付页面页面
 *
 *  @param params        参数
 *
 *  @return
 */
- (UIViewController *)UZMediator_webPayOrderVC:(NSString *)infoStr
                                   htmlContent:(NSString *) htmlContent
                                   isLastOrder:(BOOL) isLastOrder;

/**
 *  550新版支付页面
 *
 *  @param params        参数
 *
 *  @return
 */
- (UIViewController *)UZMediator_webNewPayOrderVC:(NSString *)PayUrl
                                   htmlContent:(NSString *) htmlContent
                                   isLastOrder:(NSString *) isLastOrder
                                   mainOrderId:(NSString *) mainOrderId
                                   isFromOrderDetail:(NSString *) isFromOrderDetail;




/**
 *  合同页面
 */
- (UIViewController *)UZMediator_webPactVC:(NSString *) infostr
                                 backBlock:(void(^)(void)) backBlock;

/**
 *  二维码扫描页面
 */
- (UIViewController *)UZMediator_webScaningVC:(NSString *) infoStr;

/**
 *  代金卡支付页面
 */
- (UIViewController *)UZMediator_giftcardPayVC:(CGFloat) nRemainMoney
                                       orderID:(NSString *) orderID
                                    orderSonID:(NSString *) orderSonID
                                     payDriect:(BOOL) payDriect
                                   isLastOrder:(BOOL) isLastOrder;

@end
