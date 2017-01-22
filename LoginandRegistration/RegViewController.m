//
//  RegViewController.m
//  LoginandRegistration
//
//  Created by Mohini on 21/01/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "RegViewController.h"

@interface RegViewController ()

@end

@implementation RegViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (IBAction)regSignUpButtonPressed:(id)sender {
    NSString * userName=self.regUserNameTextField.text;
    NSString *password=self.regPasswordTextField.text;
    NSString *confirmPassword=self.regConfirmPasswordTextField.text;
    //checking if fields are empty
    if([userName isEqualToString:@""] || [password isEqualToString:@""] || [confirmPassword isEqualToString :@""])
        
        [RegViewController showAlertPopup : TITLE_ERROR_ALERT andMessage :NON_EMPTY_ERROR_MESSAGE forViewController :self];
    //checking if password field and confirm password field mismatch
    else if(![password isEqualToString:confirmPassword] )
        [RegViewController showAlertPopup:TITLE_ERROR_ALERT andMessage:PASSWORD_CONFIRMPASSWORD_NOTSAME_ERROR_MESSAGE forViewController :self];
    
    //if success
    else
        [RegViewController showAlertPopup:SUCCES_ALERT_TITLE andMessage:SUCCESS_MSG forViewController :self];
    
}

+ (void) showAlertPopup:(NSString *) title andMessage: (NSString *) message forViewController :(id) vc{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [vc presentViewController:alert animated:YES completion:nil];
}
@end
