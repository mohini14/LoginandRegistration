//
//  ViewController.m
//  LoginandRegistration
//
//  Created by Mohini Sindhu  on 20/01/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "LoginViewController.h"
#import "RegViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


- (IBAction)loginButtonPressed:(UIButton *)sender {
    
    NSString *username=self.loginUserNameTextField.text;
    NSString *password=self.loginPasswordTextField.text;
    [self loginByUsername:username andPassword:password];
    
}
- (void) loginByUsername: (NSString *) username andPassword: (NSString *)password{
    
    NSString *url= @"https://www.reqres.in/api/users/200";
    NSLog(@"LOGIN URL=%@",url);
    
    NSURLSessionConfiguration *defaultConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:defaultConfiguration ];
    NSURLSessionDataTask *loginTask = [session dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        if (error != nil){
            [RegViewController showAlertPopup:@"Alert" andMessage:@"Unable to Login" forViewController:self];
        }
        else if( [(NSHTTPURLResponse *) response statusCode] !=200){
            [RegViewController showAlertPopup:@"Alert" andMessage:@"Password credentials not matched" forViewController:self];
        }else{
            NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            NSString *firstName = jsonObject[@"data"][@"first_name"];
            NSString *lastName = jsonObject[@"data"][@"last_name"];
            NSString *message = [NSString stringWithFormat:@"Welcome %@ %@", firstName, lastName];
            [RegViewController showAlertPopup:@"SUCCESS" andMessage:message forViewController:self];
        }
    }];
    
    [loginTask resume];
    
}


@end
