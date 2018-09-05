//
//  UZMediatorManager+PersonCenter.h
//  Pods
//
//  Created by weipeng on 16/7/29.
//
//
#import "UZMediatorManager.h"
#import <UIKit/UIKit.h>

@interface UZMediatorManager (PersonCenter)
/**
 *  个人中心
 *
 *  @param params        参数
 *  @param confirmAction 回调
 *
 *  @return 个人中心
 */
- (UIViewController *)UZMediator_PersonCenterVCWithParams:(NSDictionary *)params withMessage:(void(^)(void))confirmAction;
/**
 *  选中个人中心
 *
 *  @param params
 */
-(void)UZMediator_SelectPersonCenterVCWithParams:(NSDictionary *)params withMessage:(void(^)(void))confirmAction;
/**
 *  设置页面
 *
 *  @param params        参数
 *  @param confirmAction 回调
 *
 *  @return 设置页面
 */
- (UIViewController *)UZMediator_SettingVCWithParams:(NSDictionary *)params withMessage:(void(^)(void))confirmAction;
/**
 *  系统消息(我的消息)
 *
 *  @param params        参数
 *  @param confirmAction 回调
 *
 *  @return 系统消息页面
 */
- (void)UZMediator_PushToPersonalNewsVCWithParams:(NSDictionary *)params withMessage:(void(^)(void))confirmAction;
/**
 *  系统消息分类列表
 *
 *  @param type          类型
 *  @param confirmAction
 *
 *  @return 系统消息分类列表
 */
- (UIViewController *)UZMediator_CheapVCWithType:(NSString *)type withSuccessBlock:(void(^)(void))successBlock;
/**
 *  标记消息操作
 *
 *  @param messageID    消息id
 *  @param messageState 消息state
 *  @param type         类型
 *  @param successBlock
 *  @param filedBlock
 */
-(void)UZMediatior_MarkMessageWithMessageID:(NSString *)messageID WithMessageState:(NSString *)messageState WithType:(NSString *)type withSuccessBlock:(void(^)(void))successBlock andFiledBlock:(void(^)(void))filedBlock;
/**
 *  个人信息页面
 *
 *  @param params        参数
 *  @param confirmAction 回调
 *
 *  @return 个人信息页面
 */
- (void)UZMediator_PushToUserInfoVC;
/**
 *  会员等级页面
 *
 *  @param levelId 当前等级id
 *
 *  @return
 */
- (UIViewController *)UZMediator_MemberLevelVCWithLevelId:(NSString *)levelId;
/**
 *  验证旧手机页面
 *
 *  @param phoneNum 用户手机号
 *
 *  @return 验证旧手机页面
 */
- (UIViewController *)UZMediator_CheckOldPhoneVCWithUserPhoneNum:(NSString *)phoneNum;
/**
 *  修改新手机页面
 *
 *  @return 修改新手机页面
 */
- (UIViewController *)UZMediator_ChangeNewPhoneVC;
/**
 *  验证邮箱页面
 *
 *  @return 验证邮箱页面
 */
- (UIViewController *)UZMediator_ConfirmEmailVC;
/**
 *  我的积分页面
 *
 *  @param params        参数
 *  @param confirmAction 回调
 *
 *  @return 我的积分页面
 */
- (UIViewController *)UZMediator_PushToIntegralVCWithParams:(NSDictionary *)params withMessage:(void(^)(void))confirmAction;
/**
 *  我的优惠券页面
 *
 *  @param params        参数
 *  @param confirmAction 回调
 *
 *  @return 我的优惠券页面
 */
- (UIViewController *)UZMediator_PushToMyCouponVCWithParams:(NSDictionary *)params withMessage:(void(^)(void))confirmAction;
/**
 *  常用旅客页面
 *
 *  @param params        参数
 *  @param confirmAction 回调
 *
 *  @return 常用旅客页面
 */
- (UIViewController *)UZMediator_PushToToursVCWithParams:(NSDictionary *)params withMessage:(void(^)(void))confirmAction;
/**
 *  旅客信息的须知页面
 *
 *  @return
 */
- (UIViewController *)UZMediator_ToursNameInfoVC;
/**
 *  新增(编辑)常用信息
 *
 *  @param listUserPaperList 证件list
 *  @param userBirthTime     出生日期
 *  @param userSex           性别
 *  @param userNationality   国籍
 *  @param userName          名字
 *  @param firstName         名
 *  @param lastName          字
 *  @param userPhone         电话
 *  @param confirmAction
 *
 *  @return
 */
- (UIViewController *)UZMediator_CommonInfoVCWithListUserPaperList:(NSArray *)listUserPaperList WithUserBirthTime:(NSString *)userBirthTime WithUserSex:(NSString *)userSex WithUserNationality:(NSString *)userNationality WithUserName:(NSString *)userName WithFirstName:(NSString *)firstName WithLastName:(NSString *)lastName WithUserPhone:(NSString *)userPhone WithTourId:(NSString *)tourId withSuccessBlock:(void(^)(void))successBlock;
/**
 *  新增(编辑)收货地址
 *
 *  @param isUpdate      是否是编辑(1为编辑，0为新增)
 *  @param name          收货人姓名
 *  @param address       地址
 *  @param mobilePhone   联系电话
 *  @param zipCode       邮政编码
 *  @param province      省份
 *  @param confirmAction
 *
 *  @return
 */
- (UIViewController *)UZMediator_CommonAddressVCWithIsUpdate:(NSString *)isUpdate WithName:(NSString *)name WithAddress:(NSString *)address WithMobilePhone:(NSString *)mobilePhone WithZipCode:(NSString *)zipCode WithProvince:(NSString *)province WithAddressID:(NSString *)addressID withSuccessBlock:(void(^)(void))successBlock;
/**
 *  新增(编辑)发票抬头
 *
 *  @param isUpdate      是否是编辑(1为编辑，0为新增)
 *  @param invoiceHeader 发票抬头
 *  @param Id            发票id
 *  @param remark
 *  @param invoiceType   类型
 *  @param confirmAction
 *
 *  @return
 */
- (UIViewController *)UZMediator_CommonInvoiceTitleVCWithIsUpdate:(NSString *)isUpdate WithInvoiceHeader:(NSString *)invoiceHeader WithId:(NSString *)Id WithRemark:(NSString *)remark WithInvoiceType:(NSString *)invoiceType withSuccessBlock:(void(^)(void))successBlock;

/**
 *  我的收藏页面
 *
 *  @param params        参数
 *  @param confirmAction 回调
 *
 *  @return 我的收藏页面
 */
- (UIViewController *)UZMediator_PushToMyAttentionVCWithParams:(NSDictionary *)params withMessage:(void(^)(void))confirmAction;
/**
 *  关于我们
 *
 *  @param params        参数
 *  @param confirmAction 回调
 *
 *  @return 关于我们
 */
- (UIViewController *)UZMediator_AboutUsVCWithParams:(NSDictionary *)params withMessage:(void(^)(void))confirmAction;
/**
 *  意见反馈
 *
 *  @param params        参数
 *  @param confirmAction 回调
 *
 *  @return 意见反馈
 */
- (UIViewController *)UZMediator_FeedBackVCWithParams:(NSDictionary *)params withMessage:(void(^)(void))confirmAction;
@end
