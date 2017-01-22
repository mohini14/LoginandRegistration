//
//  RegViewController.h
//  LoginandRegistration
//
//  Created by Mohini on 21/01/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import <UIKit/UIKit.h>
#define NON_EMPTY_ERROR_MESSAGE @"You cannot leave any field empty"
#define TITLE_ERROR_ALERT @"Alert"
#define PASSWORD_CONFIRMPASSWORD_NOTSAME_ERROR_MESSAGE @"re-entered password mismatch"
#define SUCCES_ALERT_TITLE @"Success"
#define SUCCESS_MSG @"you have succesfully registered"




@interface RegViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *regUserNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *regPasswordTextField;
@property (strong, nonatomic) IBOutlet UITextField *regConfirmPasswordTextField;
- (IBAction)regSignUpButtonPressed:(id)sender;
+ (void) showAlertPopup:(NSString *) title andMessage: (NSString *) message forViewController :(id) vc;

@end
