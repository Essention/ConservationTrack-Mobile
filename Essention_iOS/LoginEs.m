//
//  LoginEs.m
//  Essention_iOS
//
//  Created by Oleksii on 10/28/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import "LoginEs.h"
#import "start.h"
#import "AppDelegate.h"
#import "SecondViewController.h"


@implementation LoginEs

- (void)viewDidLoad {
    [super viewDidLoad];
    _bLogin.layer.borderWidth=.5f;
    _bLogin.layer.borderColor=[[UIColor greenColor]CGColor];
    _bLogin.layer.cornerRadius=10;
    _bLogin.clipsToBounds=YES;
    // Do view setup here.
}

- (IBAction)bLogin:(id)sender {
    if (![_username.text isEqualToString:@""]&&![_password.text isEqualToString:@""]) {
        [self LoginUser];
    }
    else    {
        UIAlertView *error =[[UIAlertView alloc] initWithTitle:@"Error" message:@"You must complete fields" delegate:self cancelButtonTitle:@"Re-enter" otherButtonTitles: nil];
        [error show];
    }
}

-(void) LoginUser{
   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:_username.text forKey:@"username"];
    [defaults setObject:_password.text forKey:@"password"];
     [defaults setBool:YES forKey:@"registered"];
     [defaults synchronize];
    [self performSegueWithIdentifier:@"login_es" sender:self];
    
   // SecondViewController *second=[[SecondViewController alloc] initWithNibName:nil bundle:nil];
   // [self presentViewController:second animated:YES completion:NULL];
}
@end
