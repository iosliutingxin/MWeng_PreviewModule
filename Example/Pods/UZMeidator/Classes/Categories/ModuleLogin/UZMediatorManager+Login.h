//
//  UZMediatorManager+Login.h
//  Pods
//
//  Created by leijian on 16/8/3.
//
//

#import "UZMediatorManager.h"

@interface UZMediatorManager (Login)
/**
 *  登录
 *
 *  @param params
 *  @param successBlock
 *  @param cancleBlock      
 */
- (void)UZMediator_PresentToLoginNavVCWithParams:(NSDictionary *)params withSuccessBlock:(void(^)(void))successBlock andCancleBlock:(void(^)(void))cancleBlock;
/**
 *  注册
 *
 *  @param params
 *
 *  @return
 */
- (UIViewController *)UZMediator_LogonVCWithParams:(NSDictionary *)params;
/**
 *  隐私政策
 *
 *  @param params
 *
 *  @return
 */
- (UIViewController *)UZMediator_PrivacyVCWithParams:(NSDictionary *)params;
/**
 *  绑定
 *
 *  @param params
 *
 *  @return
 */
-(UIViewController *)UZMediator_BindingAccountVCWithParams:(NSDictionary *)params;
/**
 *  登录并绑定
 *
 *  @param params
 *
 *  @return
 */
-(UIViewController *)UZMediator_LoginAndBindingWithParams:(NSDictionary *)params;
/**
 *  注册并绑定
 *
 *  @param params
 *
 *  @return
 */
-(UIViewController *)UZMediator_LogonAndBindingWithParams:(NSDictionary *)params;
/**
 *  修改密码
 *
 *  @param params
 *
 *  @return
 */
-(UIViewController *)UZMediator_ChangePasswdWithParams:(NSDictionary *)params;
/**
 *  密码找回
 *
 *  @param params
 *
 *  @return
 */
-(UIViewController *)UZMediator_FindPasswordWithPhoneNum:(NSString *)phoneNum andIsChangePassword:(BOOL)isChangePassword;
/**
 *  重置密码
 *
 *  @param params
 *
 *  @return
 */
-(UIViewController *)UZMediator_ReSetPasswordWithParams:(NSDictionary *)params;

/**
 *  获取用户信息
 *
 *  @param params
 *  @param successBlock
 *  @param filedBlock
 */
-(void)UZMediatior_GetUserInfoWithParams:(NSDictionary *)params withSuccessBlock:(void(^)(id userInfo))successBlock andFiledBlock:(void(^)(void))filedBlock;

-(void)UZMediatior_AutoLoginWithUserName:(NSString *)userName andPassword:(NSString *)password andIsUninLogin:(NSString *)isUninLogin andUninTypeID:(NSString *)uninTypeID andUserId:(NSString *)userId andUzaiToken:(NSString *)uzaiToken withSuccessBlock:(void(^)(void))successBlock andFiledBlock:(void(^)(void))filedBlock;
@end
