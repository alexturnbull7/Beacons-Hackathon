//
//  LoginViewController.h
//  ProjectElephant
//
//  Created by Kris Jones on 11/04/2015.
//  Copyright (c) 2015 Elephant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "SVProgressHUD.h"
#import "AFNetworking.h"
#import "Constants.h"
#import "DashboardViewController.h" 

@interface LoginViewController : UIViewController <UITextFieldDelegate>
- (IBAction)Login:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;

@end
