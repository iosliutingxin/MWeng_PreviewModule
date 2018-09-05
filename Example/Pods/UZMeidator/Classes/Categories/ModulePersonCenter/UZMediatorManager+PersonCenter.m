//
//  UZMediatorManager+PersonCenter.m
//  Pods
//
//  Created by weipeng on 16/7/29.
//
//

#import "UZMediatorManager+PersonCenter.h"

NSString * const kCTMediatorTargetPersonCenter = @"PersonCenter";//个人中心
NSString * const kCTMediatorActionPersonCenterController = @"pushToPersonCenter";
NSString * const kUZMediatorActionSelectPersonCenterVC = @"selectPersonCenter";

NSString * const kCTMediatorTargetSetting = @"Setting";//设置
NSString * const kCTMediatorActionSettingController = @"pushToSetting";

NSString * const kCTMediatorTargetPersonalNews = @"PersonalNews";//系统消息
NSString * const kCTMediatorActionPersonalNewsController = @"pushToPersonalNews";

NSString * const kCTMediatorTargetCheap = @"Cheap";//系统消息分类列表
NSString * const kCTMediatorActionCheapController = @"pushToCheap";

NSString * const kCTMediatorActionMarkMessage = @"markMessage";//标记消息

NSString * const kCTMediatorTargetUserInfo = @"UserInfo";//个人信息
NSString * const kCTMediatorActionUserInfoController = @"pushToUserInfo";

NSString * const kCTMediatorTargetMemberLevel = @"MemberLevel";//会员等级
NSString * const kCTMediatorActionMemberLevelController = @"pushToMemberLevel";

NSString * const kCTMediatorTargetCheckOldPhone = @"CheckOldPhone";//验证旧手机
NSString * const kCTMediatorActionCheckOldPhoneController = @"pushToCheckOldPhone";

NSString * const kCTMediatorTargetChangeNewPhone = @"ChangeNewPhone";//修改新手机
NSString * const kCTMediatorActionChangeNewPhoneController = @"pushToChangeNewPhone";

NSString * const kCTMediatorTargetConfirmEmail = @"ConfirmEmail";//验证邮箱
NSString * const kCTMediatorActionConfirmEmailController = @"pushToConfirmEmail";

NSString * const kCTMediatorTargetIntegral = @"Integral";//积分
NSString * const kCTMediatorActionIntegralController = @"pushToIntegral";

NSString * const kCTMediatorTargetMyCoupon = @"MyCoupon";//我的优惠券
NSString * const kCTMediatorActionMyCouponController = @"pushToMyCoupon";

NSString * const kCTMediatorTargetTours = @"Tours";//常用信息
NSString * const kCTMediatorActionToursController = @"pushToTours";

NSString * const kCTMediatorActionToursNameInfoController = @"pushToToursNameInfo";//旅客信息须知
NSString * const kCTMediatorActionTravelInfoController = @"pushToTravelInfo";//旅客信息
NSString * const kCTMediatorActionAddressController = @"pushToAddress";//收货地址
NSString * const kCTMediatorActionInvoiceTitleController = @"pushToInvoiceTitle";//发票抬头


NSString * const kCTMediatorTargetMyAttention = @"MyAttention";//我的收藏
NSString * const kCTMediatorActionMyAttentionController = @"pushToMyAttention";

NSString * const kCTMediatorTargetAboutUs = @"AboutUs";//关于我们
NSString * const kCTMediatorActionAboutUsController = @"pushToAboutUs";

NSString * const kCTMediatorTargetFeedBack = @"FeedBack";//意见反馈
NSString * const kCTMediatorActionFeedBackController = @"pushToFeedBack";

@implementation UZMediatorManager (PersonCenter)
//个人中心
- (UIViewController *)UZMediator_PersonCenterVCWithParams:(NSDictionary *)params withMessage:(void(^)(void))confirmAction
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    paramsToSend[@"confirmAction"] = confirmAction;
    UIViewController *vc = [self performTarget:kCTMediatorTargetPersonCenter action:kCTMediatorActionPersonCenterController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
//选择个人中心
-(void)UZMediator_SelectPersonCenterVCWithParams:(NSDictionary *)params withMessage:(void(^)(void))confirmAction
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    paramsToSend[@"confirmAction"] = confirmAction;
    [self performTarget:kCTMediatorTargetPersonCenter action:kUZMediatorActionSelectPersonCenterVC params:paramsToSend];
}
//设置
- (UIViewController *)UZMediator_SettingVCWithParams:(NSDictionary *)params withMessage:(void(^)(void))confirmAction
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    paramsToSend[@"confirmAction"] = confirmAction;
    UIViewController *vc = [self performTarget:kCTMediatorTargetSetting action:kCTMediatorActionSettingController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
//系统消息
-(void)UZMediator_PushToPersonalNewsVCWithParams:(NSDictionary *)params withMessage:(void (^)(void))confirmAction
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    paramsToSend[@"confirmAction"] = confirmAction;
    [self performTarget:kCTMediatorTargetPersonalNews action:kCTMediatorActionPersonalNewsController params:paramsToSend];

}
//系统消息分类列表
- (UIViewController *)UZMediator_CheapVCWithType:(NSString *)type withSuccessBlock:(void(^)(void))successBlock
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:@{@"Type":type}];
    paramsToSend[@"successBlock"] = successBlock;
    UIViewController *vc = [self performTarget:kCTMediatorTargetCheap action:kCTMediatorActionCheapController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
//标记系统消息
-(void)UZMediatior_MarkMessageWithMessageID:(NSString *)messageID WithMessageState:(NSString *)messageState WithType:(NSString *)type withSuccessBlock:(void (^)(void))successBlock andFiledBlock:(void (^)(void))filedBlock
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:@{@"MessageID":messageID,@"MessageState":messageState,@"Type":type}];
    paramsToSend[@"successBlock"] = successBlock;
    paramsToSend[@"filedBlock"] = filedBlock;
    [self performTarget:kCTMediatorTargetCheap action:kCTMediatorActionMarkMessage params:paramsToSend];
}
//个人信息
-(void)UZMediator_PushToUserInfoVC
{
    [self performTarget:kCTMediatorTargetUserInfo action:kCTMediatorActionUserInfoController params:@{}];
}
//会员等级
- (UIViewController *)UZMediator_MemberLevelVCWithLevelId:(NSString *)levelId
{
    NSDictionary *params=@{@"MemberLevel":levelId};
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    UIViewController *vc = [self performTarget:kCTMediatorTargetMemberLevel action:kCTMediatorActionMemberLevelController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
//验证旧手机
-(UIViewController *)UZMediator_CheckOldPhoneVCWithUserPhoneNum:(NSString *)phoneNum
{
    NSDictionary *params=@{@"UserPhoneNum":phoneNum};
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    UIViewController *vc = [self performTarget:kCTMediatorTargetCheckOldPhone action:kCTMediatorActionCheckOldPhoneController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
//修改新手机
-(UIViewController *)UZMediator_ChangeNewPhoneVC
{
    UIViewController *vc = [self performTarget:kCTMediatorTargetChangeNewPhone action:kCTMediatorActionChangeNewPhoneController params:@{}];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
//验证邮箱
-(UIViewController *)UZMediator_ConfirmEmailVC
{
    UIViewController *vc = [self performTarget:kCTMediatorTargetConfirmEmail action:kCTMediatorActionConfirmEmailController params:@{}];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
//我的积分
-(UIViewController *)UZMediator_PushToIntegralVCWithParams:(NSDictionary *)params withMessage:(void (^)(void))confirmAction
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    paramsToSend[@"confirmAction"] = confirmAction;
    UIViewController *vc = [self performTarget:kCTMediatorTargetIntegral action:kCTMediatorActionIntegralController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
//我的优惠券
-(UIViewController *)UZMediator_PushToMyCouponVCWithParams:(NSDictionary *)params withMessage:(void (^)(void))confirmAction
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    paramsToSend[@"confirmAction"] = confirmAction;
    UIViewController *vc = [self performTarget:kCTMediatorTargetMyCoupon action:kCTMediatorActionMyCouponController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
//常用旅客
-(UIViewController *)UZMediator_PushToToursVCWithParams:(NSDictionary *)params withMessage:(void (^)(void))confirmAction
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    paramsToSend[@"confirmAction"] = confirmAction;
    UIViewController *vc = [self performTarget:kCTMediatorTargetTours action:kCTMediatorActionToursController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
//旅客信息须知
- (UIViewController *)UZMediator_ToursNameInfoVC
{
    UIViewController *vc = [self performTarget:kCTMediatorTargetTours action:kCTMediatorActionToursNameInfoController params:@{}];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
//常用信息
-(UIViewController *)UZMediator_CommonInfoVCWithListUserPaperList:(NSArray *)listUserPaperList WithUserBirthTime:(NSString *)userBirthTime WithUserSex:(NSString *)userSex WithUserNationality:(NSString *)userNationality WithUserName:(NSString *)userName WithFirstName:(NSString *)firstName WithLastName:(NSString *)lastName WithUserPhone:(NSString *)userPhone WithTourId:(NSString *)tourId withSuccessBlock:(void (^)(void))successBlock
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:
                                         @{@"listUserPaperList":listUserPaperList?listUserPaperList:@"",
                                           @"UserBirthTime":userBirthTime?userBirthTime:@"",
                                           @"UserSex":userSex?userSex:@"",
                                           @"UserNationality":userNationality?userNationality:@"",
                                           @"UserName":userName?userName:@"",
                                           @"FirstName":firstName?firstName:@"",
                                           @"LastName":lastName?lastName:@"",
                                           @"UserPhone":userPhone?userPhone:@"",
                                           @"ID":tourId?tourId:@""}];
    paramsToSend[@"successBlock"] = successBlock;
    UIViewController *vc = [self performTarget:kCTMediatorTargetTours action:kCTMediatorActionTravelInfoController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
//收货地址
- (UIViewController *)UZMediator_CommonAddressVCWithIsUpdate:(NSString *)isUpdate WithName:(NSString *)name WithAddress:(NSString *)address WithMobilePhone:(NSString *)mobilePhone WithZipCode:(NSString *)zipCode WithProvince:(NSString *)province WithAddressID:(NSString *)addressID withSuccessBlock:(void (^)(void))successBlock
{
    NSDictionary *tempDic;
    if ([isUpdate isEqualToString:@"1"]) {
        //修改
      tempDic = @{@"IsUpdate":@"1",
                  @"Name":name?name:@"",
                  @"Address":address?address:@"",
                  @"MobilePhone":mobilePhone?mobilePhone:@"",
                  @"ZipCode":zipCode?zipCode:@"",
                  @"Province":province?province:@"",
                  @"AddressID":addressID?addressID:@""};
    }else {
        //新增
        tempDic = @{@"IsUpdate":@"0"};
    }
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:tempDic];
    paramsToSend[@"successBlock"] = successBlock;
    UIViewController *vc = [self performTarget:kCTMediatorTargetTours action:kCTMediatorActionAddressController params:(NSDictionary *)paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
//发票抬头
-(UIViewController *)UZMediator_CommonInvoiceTitleVCWithIsUpdate:(NSString *)isUpdate WithInvoiceHeader:(NSString *)invoiceHeader WithId:(NSString *)Id WithRemark:(NSString *)remark WithInvoiceType:(NSString *)invoiceType withSuccessBlock:(void (^)(void))successBlock
{
    NSDictionary *tempDic;
    if ([isUpdate isEqualToString:@"1"]) {
        //修改
        tempDic = @{@"IsUpdate":@"1",@"InvoiceHeader":invoiceHeader,@"ID":Id,@"Remark":remark,@"InvoiceType":invoiceType};
    }else {
        //新增
        tempDic = @{@"IsUpdate":@"0"};
    }
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:tempDic];
    paramsToSend[@"successBlock"] = successBlock;
    UIViewController *vc = [self performTarget:kCTMediatorTargetTours action:kCTMediatorActionInvoiceTitleController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
//我的收藏
-(UIViewController *)UZMediator_PushToMyAttentionVCWithParams:(NSDictionary *)params withMessage:(void (^)(void))confirmAction
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    paramsToSend[@"confirmAction"] = confirmAction;
    UIViewController *vc = [self performTarget:kCTMediatorTargetMyAttention action:kCTMediatorActionMyAttentionController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
//关于我们
- (UIViewController *)UZMediator_AboutUsVCWithParams:(NSDictionary *)params withMessage:(void (^)(void))confirmAction
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    paramsToSend[@"confirmAction"] = confirmAction;
    UIViewController *vc = [self performTarget:kCTMediatorTargetAboutUs action:kCTMediatorActionAboutUsController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
//意见反馈
- (UIViewController *)UZMediator_FeedBackVCWithParams:(NSDictionary *)params withMessage:(void (^)(void))confirmAction
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    paramsToSend[@"confirmAction"] = confirmAction;
    UIViewController *vc = [self performTarget:kCTMediatorTargetFeedBack action:kCTMediatorActionFeedBackController params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
@end
