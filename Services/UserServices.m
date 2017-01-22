//
// Created by Anas MD on 22/01/17.
// Copyright (c) 2017 Mohini Sindhu . All rights reserved.
//

#import "UserServices.h"



@implementation UserServices {

}
- (void)loginByEmail:(NSString *)email andPassowrd:(NSString *)password andCallBackMethod:(void (^)(BOOL success, NSDictionary *data))callBack {

    NSMutableDictionary *dict = [NSMutableDictionary new];
    dict[@"email"] = email;
    dict[@"password"] = password;

    NSString *urlString = [NSString stringWithFormat:@"%@%@", HOST, REGISTER_RESOURCE_API];
    NSLog(@"register by using API=%@", urlString);

    [self POSTWithURL:urlString andData:dict completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        NSLog(@"data = %@, response=%@ error=%@", data.description, response.description, error.description );
        if(error !=nil){
            callBack(false,  @{@"error":@"Unable to Reach server"});
        }else {
            NSDictionary *jsonObject=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];

            if( [(NSHTTPURLResponse *)response statusCode]==400){         // http code for error
                callBack(false, jsonObject );
            }else{
                callBack(true, jsonObject);
            }
        }
    }];

}



@end