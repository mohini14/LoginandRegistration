//
//  ViewController.h
//  LoginandRegistration
//
//  Created by Mohini Sindhu  on 20/01/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegViewController.h"

@interface LoginViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *loginUserNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *loginPasswordTextField;
- (IBAction)loginButtonPressed:(UIButton *)sender;


@end

