//
// Created by Anas MD on 22/01/17.
// Copyright (c) 2017 Mohini Sindhu . All rights reserved.
//

#import "HTTPServices.h"


@implementation HTTPServices {

}
- (void)GETWithURL:(NSString *)urlString completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandlerCallBack {

    NSURL *nsUrl = [NSURL URLWithString:urlString];
    NSURLSessionConfiguration * defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultSessionConfiguration];
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithURL:nsUrl completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error){
        completionHandlerCallBack(data, response, error);
    }];

    [dataTask resume];
}

- (void)POSTWithURL:(NSString *)urlString andData:(NSDictionary *)postData completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandlerCallBack {
    NSURL *nsUrl = [NSURL URLWithString:urlString];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:nsUrl];
    NSURLSessionConfiguration * defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultSessionConfiguration];
    [urlRequest setHTTPMethod:@"POST"];  // set http verb
    NSData *nsPostData = [NSJSONSerialization dataWithJSONObject:postData options:0 error:nil];  // convert dict to json
    [urlRequest setHTTPBody:nsPostData];

    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:urlRequest completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error){
        completionHandlerCallBack(data, response, error);
    }];

    [dataTask resume];

}


@end