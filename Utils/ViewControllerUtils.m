//
// Created by Anas MD on 23/01/17.
// Copyright (c) 2017 Mohini Sindhu . All rights reserved.
//

#import "ViewControllerUtils.h"


@implementation ViewControllerUtils {

}
+ (void)showAlertPopup:(NSString *)title andMessage:(NSString *)message forViewController:(UIViewController *)vc {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];

    [alert addAction:defaultAction];
    [vc presentViewController:alert animated:YES completion:nil];
}

@end