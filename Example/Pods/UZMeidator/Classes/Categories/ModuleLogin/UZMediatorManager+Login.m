//
//  UZMediatorManager+Login.m
//  Pods
//
//  Created by leijian on 16/8/3.
//
//

#import "UZMediatorManager+Login.h"

NSString * const kUZMediatorTargetLogin = @"login";
NSString * const kUZMediatorActionPresentToLoginNavVC = @"presentToLogin";
NSString * const kUZMediatorActionPushToLogonVC = @"pushToLogon";
NSString * const kUZMediatorActionPushToPrivacy = @"pushToPrivacy";
NSString * const kUZMediatorActionPushToBindingAccount = @"pushToBindingAccount";
NSString * const kUZMediatorActionPushToLoginAndBinding = @"pushToLoginAndBinding";
NSString * const kUZMediatorActionPushToLogonAndBinding = @"pushToLogonAndBinding";
NSString * const kUZMediatorActionPushToChangePasswd = @"pushToChangePasswd";
NSString * const kUZMediatorActionPushToFindPassword = @"pushToFindPassword";
NSString * const kUZMediatorActionPushToReSetPassword = @"pushToReSetPassword";
NSString * const kUZMediatorActionGetUserInfo = @"getUserInfo";
NSString * const kUZMediatorActionAutoLogin = @"autoLogin";
@implementation UZMediatorManager (Login)
- (void)UZMediator_PresentToLoginNavVCWithParams:(NSDictionary *)params withSuccessBlock:(void(^)(void))successBlock andCancleBlock:(void(^)(void))cancleBlock
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    paramsToSend[@"successBlock"] = successBlock;
    paramsToSend[@"cancleBlock"] = cancleBlock;
    [self performTarget:kUZMediatorTargetLogin action:kUZMediatorActionPresentToLoginNavVC params:paramsToSend];
}
-(void)UZMediatior_GetUserInfoWithParams:(NSDictionary *)params withSuccessBlock:(void(^)(id userInfo))successBlock andFiledBlock:(void(^)(void))filedBlock
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    paramsToSend[@"successBlock"] = successBlock;
    paramsToSend[@"filedBlock"] = filedBlock;
    [self performTarget:kUZMediatorTargetLogin action:kUZMediatorActionGetUserInfo params:paramsToSend];
}

- (UIViewController *)UZMediator_LogonVCWithParams:(NSDictionary *)params
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    UIViewController *vc = [self performTarget:kUZMediatorTargetLogin action:kUZMediatorActionPushToLogonVC params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

- (UIViewController *)UZMediator_PrivacyVCWithParams:(NSDictionary *)params
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    UIViewController *vc = [self performTarget:kUZMediatorTargetLogin action:kUZMediatorActionPushToPrivacy params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
-(UIViewController *)UZMediator_BindingAccountVCWithParams:(NSDictionary *)params
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    UIViewController *vc = [self performTarget:kUZMediatorTargetLogin action:kUZMediatorActionPushToBindingAccount params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
-(UIViewController *)UZMediator_LoginAndBindingWithParams:(NSDictionary *)params
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    UIViewController *vc = [self performTarget:kUZMediatorTargetLogin action:kUZMediatorActionPushToLoginAndBinding params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
-(UIViewController *)UZMediator_LogonAndBindingWithParams:(NSDictionary *)params
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    UIViewController *vc = [self performTarget:kUZMediatorTargetLogin action:kUZMediatorActionPushToLogonAndBinding params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
-(UIViewController *)UZMediator_ChangePasswdWithParams:(NSDictionary *)params
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    UIViewController *vc = [self performTarget:kUZMediatorTargetLogin action:kUZMediatorActionPushToChangePasswd params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
-(UIViewController *)UZMediator_FindPasswordWithPhoneNum:(NSString *)phoneNum andIsChangePassword:(BOOL)isChangePassword
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:@{@"phoneNum":phoneNum?:@"",@"isChangePassword":@(isChangePassword)?:NO}];
    UIViewController *vc = [self performTarget:kUZMediatorTargetLogin action:kUZMediatorActionPushToFindPassword params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
-(UIViewController *)UZMediator_ReSetPasswordWithParams:(NSDictionary *)params
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:params];
    UIViewController *vc = [self performTarget:kUZMediatorTargetLogin action:kUZMediatorActionPushToReSetPassword params:paramsToSend];
    if ([vc isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
-(void)UZMediatior_AutoLoginWithUserName:(NSString *)userName andPassword:(NSString *)password andIsUninLogin:(NSString *)isUninLogin andUninTypeID:(NSString *)uninTypeID andUserId:(NSString *)userId andUzaiToken:(NSString *)uzaiToken withSuccessBlock:(void (^)(void))successBlock andFiledBlock:(void (^)(void))filedBlock
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] initWithDictionary:@{@"userName":userName?:@"",
                                                                                          @"password":password?:@"",
                                                                                          @"isUninLogin":isUninLogin?:@"",
                                                                                          @"uninTypeID":uninTypeID?:@"",
                                                                                          @"userId":userId?:@"",
                                                                                          @"uzaiToken":uzaiToken?:@""}];
    [self performTarget:kUZMediatorTargetLogin action:kUZMediatorActionAutoLogin params:paramsToSend];
}
@end
