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
    if([username isEqualToString:@""] ||   [password isEqualToString:@""])
        [RegViewController showAlertPopup:TITLE_ERROR_ALERT andMessage:NON_EMPTY_ERROR_MESSAGE forViewController:self];
    else if(![username isEqualToString:password])
        [RegViewController showAlertPopup: TITLE_ERROR_ALERT andMessage:PASSWORD_CONFIRMPASSWORD_NOTSAME_ERROR_MESSAGE forViewController:self];
    else
        [RegViewController showAlertPopup:SUCCES_ALERT_TITLE andMessage:SUCCESS_MSG forViewController:self];
    
    
}

@end
