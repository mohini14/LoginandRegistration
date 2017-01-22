//
// Created by Anas MD on 22/01/17.
// Copyright (c) 2017 Mohini Sindhu . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPServices.h"

#define HOST @"https://www.reqres.in"
#define REGISTER_RESOURCE_API @"/api/register"
#define LOGIN_RESOURCE_API @"/api/login"
#define SERVER_ERROR @"Unable to Reach server"

@interface UserServices : HTTPServices

-(void)loginByEmail:(NSString *)email andPassowrd:(NSString *)password andCallBackMethod:(void (^) (BOOL success, NSDictionary *data))callBackFromVC;
-(void)registerByEmail:(NSString *)email andPassword:(NSString *)password andCallBackMethod:(void (^)(BOOL success, NSDictionary *data))callBackFromVC;

@end