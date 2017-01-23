//
// Created by Anas MD on 22/01/17.
// Copyright (c) 2017 Mohini Sindhu . All rights reserved.
//

#import "UserServices.h"



@implementation UserServices {

}
- (void)loginByEmail:(NSString *)email andPassowrd:(NSString *)password andCallBackMethod:(void (^)(BOOL success, NSDictionary *data))callBackFromVC {
    
    NSMutableDictionary *dict = [NSMutableDictionary new];
    dict[@"email"] = email;
    dict[@"password"] = password;

    NSString *urlString = [NSString stringWithFormat:@"%@%@", HOST, LOGIN_RESOURCE_API];
    NSLog(@"logging by using API=%@ and data=%@", urlString, dict.description);

    [self POSTWithURL:urlString andData:dict completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        NSLog(@"data = %@, response=%@ error=%@", data.description, response.description, error.description );
        
        
            BOOL _firstParameter;
        NSDictionary *_second_parameter;
        
        if(error !=nil){
            
           
            _firstParameter=false;
            _second_parameter=@{@"error":SERVER_ERROR};
            
            }else {
            
            NSDictionary *jsonObject=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];

            if( [(NSHTTPURLResponse *)response statusCode]==200){         // http code for error
                _firstParameter=true;
                _second_parameter=jsonObject;
                
            }else{
                _firstParameter=false;
                _second_parameter=jsonObject;
                
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            callBackFromVC(_firstParameter, _second_parameter);
            
});
    }];
}

- (void)registerByEmail:(NSString *)email andPassword:(NSString *)password andCallBackMethod:(void (^)(BOOL success, NSDictionary *data))callBackFromVC {
    NSDictionary *dict = @{
        @"email":email,
        @"password":password
    };

    NSString * urlString = [NSString stringWithFormat:@"%@%@", HOST, REGISTER_RESOURCE_API];
    NSLog(@"regiter by using API=%@ and data=%@", urlString, dict.description);
    [self POSTWithURL:urlString andData:dict completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        NSLog(@"data = %@, response=%@ error=%@", data.description, response.description, error.description );
        dispatch_async(dispatch_get_main_queue(), ^{

        if(error != nil){
            callBackFromVC(false, @{@"error":SERVER_ERROR});
        }else{
            NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            if( [(NSHTTPURLResponse *)response statusCode]==201) {       // successfully created / registered
                callBackFromVC(true, jsonObject);
            }else{
                callBackFromVC(false, jsonObject);
            }
        }
            });
    }];

}


@end
