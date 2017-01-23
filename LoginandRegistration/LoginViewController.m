//
//  ViewController.m
//  LoginandRegistration
//
//  Created by Mohini Sindhu  on 20/01/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "LoginViewController.h"
#import "RegViewController.h"
#import "UserServices.h"
#import "ViewControllerUtils.h"

@interface LoginViewController ()

@end

@implementation LoginViewController{
    UserServices *_userServices ;
}

- (void)viewDidLoad {
	[super viewDidLoad];
    _userServices = [UserServices new];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


- (IBAction)loginButtonPressed:(UIButton *)sender {
    
    NSString *username=self.loginUserNameTextField.text;
    NSString *password=self.loginPasswordTextField.text;
    [[self loginUserNameTextField] resignFirstResponder]; // remove keyboard once login pressed
    [[self loginPasswordTextField] resignFirstResponder];
    
    [_userServices loginByEmail:username andPassowrd:password andCallBackMethod:^(BOOL success, NSDictionary *data) {

        if(success == TRUE){
            NSString *message = [NSString stringWithFormat:@"Login SUccessfull with token %@", data[@"token"] ];
            [ViewControllerUtils showAlertPopup:@"Success" andMessage:message forViewController:self];
        }else{
            NSString *message = [NSString stringWithFormat:@"Login Failed : Error %@", data[@"error"] ];
            [ViewControllerUtils showAlertPopup:@"Failed" andMessage:message forViewController:self];

        }

    }];
}


@end




