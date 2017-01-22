//
//  RegViewController.m
//  LoginandRegistration
//
//  Created by Mohini on 21/01/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "RegViewController.h"
#import "UserServices.h"
#import "ViewControllerUtils.h"

@interface RegViewController ()

@end

@implementation RegViewController{
    UserServices *_userServices;
    UIActivityIndicatorView *_indicator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _userServices = [UserServices new];
    _indicator = [ViewControllerUtils getLoadingindicator];
    _indicator.center = self.view.center;
    [self.view addSubview:_indicator];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (IBAction)regSignUpButtonPressed:(id)sender {
    NSString * userName=self.regUserNameTextField.text;
    NSString *password=self.regPasswordTextField.text;
    NSString *confirmPassword=self.regConfirmPasswordTextField.text;

    // to start spinning
    [self.view setUserInteractionEnabled:NO];
    [_indicator startAnimating];

    if([password isEqualToString:confirmPassword]){
        [_userServices registerByEmail:userName andPassword:password andCallBackMethod:^(BOOL success, NSDictionary *data){

            if(success == TRUE){
                NSString *message = [NSString stringWithFormat:@"Registration Successfull with token %@", data[@"token"] ];
                [ViewControllerUtils showAlertPopup:@"Success" andMessage:message forViewController:self];
            }else{
                NSString *message = [NSString stringWithFormat:@"Registration Failed : Error %@", data[@"error"] ];
                [ViewControllerUtils showAlertPopup:@"Failed" andMessage:message forViewController:self];
            }

        }];
    }


    
}

@end
