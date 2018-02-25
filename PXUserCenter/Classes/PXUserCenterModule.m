//
//  PXUserCenterModule.m
//  PXUserCenter_Example
//
//  Created by Andrew on 2018/2/25.
//  Copyright © 2018年 Andrew. All rights reserved.
//

#import "PXUserCenterModule.h"

// utils
#import <MGJRouter/MGJRouter.h>

// view controllers
#import "PXUserCenterViewController.h"

@implementation PXUserCenterModule

+ (void)load {
    [MGJRouter registerURLPattern:@"PX://UserCenter/HomeViewController" toHandler:^(NSDictionary *routerParameters) {
        UINavigationController *navigationViewController = routerParameters[MGJRouterParameterUserInfo][@"navigationViewController"];
        PXUserCenterViewController *userCenterViewController = [[PXUserCenterViewController alloc] init];
        [navigationViewController pushViewController:userCenterViewController animated:YES];
    }];
    
    [MGJRouter registerURLPattern:@"PX://UserCenter/Calculator" toObjectHandler:^id(NSDictionary *routerParameters) {
        return [NSNumber numberWithInteger:[routerParameters[MGJRouterParameterUserInfo][@"number"] integerValue] * 2];
    }];
}

@end
