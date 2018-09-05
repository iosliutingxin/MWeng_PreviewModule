//
//  UZMediatorManager+DestinationChannel.h
//  Pods
//
//  Created by weipeng on 16/8/2.
//
//
#import "UZMediatorManager.h"
#import <UIKit/UIKit.h>

@interface UZMediatorManager (DestinationChannel)
/**
 *  目的地频道页
 *
 *  @param fields3     相当于travelClassID
 *  @param fields2     关键字
 *  @param navLinkName 名称
 *  @param ID          id
 *
 *  @return
 */
- (UIViewController *)UZMediator_DestinationChannelVCWithFields3:(NSString *)fields3 WithFields2:(NSString *)fields2 WithNavLinkName:(NSString *)navLinkName withID:(NSString *)ID;
/**
 *  全部目的地
 *
 *  @param fields3     相当于travelClassID
 *  @param navLinkName 父导航名
 *  @param ID          id
 *
 *  @return 
 */
- (UIViewController *)UZMediator_AllDestinationChannelVCWithFields3:(NSString *)fields3 WithNavLinkName:(NSString *)navLinkName withID:(NSString *)ID;
@end
