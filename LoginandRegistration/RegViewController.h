//
//  RegViewController.h
//  LoginandRegistration
//
//  Created by Mohini on 21/01/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *regUserNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *regPasswordTextField;
@property (strong, nonatomic) IBOutlet UITextField *regConfirmPasswordTextField;
- (IBAction)regSignUpButtonPressed:(id)sender;

@end
