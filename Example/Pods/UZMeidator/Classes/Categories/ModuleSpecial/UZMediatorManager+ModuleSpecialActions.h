//
//  UZMediator+ModuleSpecialActions.h
//  UzaiModuleApp
//
//  Created by leijian on 16/6/30.
//  Copyright © 2016年 Uzai. All rights reserved.
//

#import "UZMediatorManager.h"
#import <UIKit/UIKit.h>

@interface UZMediatorManager (ModuleSpecialActions)

/**
 *  获取特卖会
 *
 *  @param params
 *
 *  @return
 */
- (UIViewController *)UZMediator_SpecialVCWithParams:(NSDictionary *)params;

/**
 *  选中特卖会
 *
 *  @param params 
 */
-(void)UZMediator_SelectSpeciaVCWithProductType:(NSInteger)productType andChannel:(NSString *)channel;
@end
