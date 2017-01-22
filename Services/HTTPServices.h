//
// Created by Anas MD on 22/01/17.
// Copyright (c) 2017 Mohini Sindhu . All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HTTPServices : NSObject

-(void) GETWithURL: (NSString *) urlString  completionHandler: (void(^)(NSData *data, NSURLResponse *response, NSError *error)) completionHandlerCallBack;

-(void) POSTWithURL: (NSString *) urlString andData:(NSDictionary *)postData  completionHandler: (void(^)(NSData *data, NSURLResponse *response, NSError *error)) completionHandlerCallBack;
@end