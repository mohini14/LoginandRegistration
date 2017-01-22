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
    UIActivityIndicatorView * _indicator;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _userServices = [UserServices new];
    _indicator = [ViewControllerUtils getLoadingindicator];
    _indicator.center = self.view.center;
    [self.view addSubview:_indicator];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


- (IBAction)loginButtonPressed:(UIButton *)sender {
    
    NSString *username=self.loginUserNameTextField.text;
    NSString *password=self.loginPasswordTextField.text;


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




