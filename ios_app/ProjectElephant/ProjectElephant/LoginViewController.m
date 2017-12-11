//
//  LoginViewController.m
//  ProjectElephant
//
//  Created by Kris Jones on 11/04/2015.
//  Copyright (c) 2015 Elephant. All rights reserved.
//

#import "LoginViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)init
{
    self = [super initWithNibName:@"LoginViewController" bundle:nil];
    if (self) {
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.username.delegate = self;
    self.password.delegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    if(textField == self.password){
        [self login];
    }
    
    return YES;
}

-(void)login{
    [SVProgressHUD showWithStatus:@"Loading..." maskType:SVProgressHUDMaskTypeGradient];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:@"%@isValidUser/%@/%@",WEBSERVICE,self.username.text, self.password.text] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
          [SVProgressHUD dismiss];
        NSLog(@"JSON: %@", responseObject);

        
        NSDictionary *loginInfo = responseObject;
        
        NSLog(@"Dictionary: %@", loginInfo);
        
        if([loginInfo valueForKey:@"isValidUser"]){
            
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:self.username.text forKey:@"username"];
            [defaults setObject:self.password.text forKey:@"password"];
            [defaults synchronize];
            
            [self dismissViewControllerAnimated:YES completion:nil];
        }else{
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Unsuccessful"
                                                            message:@"Your username or password is incorrect."
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }

        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
          [SVProgressHUD dismiss];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Unsuccessful"
                                                        message:@"Your username or password is incorrect."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)Login:(id)sender {
    [self login];
    
}
@end
