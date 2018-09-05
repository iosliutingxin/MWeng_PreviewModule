//
//  UZMediatorManager+GuideActions.h
//  Pods
//
//  Created by leijian on 16/7/18.
//
//
#import "UZMediatorManager.h"
#import <UIKit/UIKit.h>
@interface UZMediatorManager (Guide)
- (UIViewController *)UZMediator_GuideVCWithIsFormPersonCenterPage:(BOOL)isFormPersonCenterPage withMessage:(void(^)(void))confirmAction;
@end
