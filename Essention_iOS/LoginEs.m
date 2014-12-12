//
//  LoginEs.m
//  Essention_iOS
//
//  Created by Oleksii on 10/28/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//Kevin
//N1keDym0


#import "LoginEs.h"
//#import "start.h"
//#import "AppDelegate.h"
//#import "SecondViewController.h"


@implementation LoginEs

- (void)viewDidLoad {
    [super viewDidLoad];
    _bLogin.layer.borderWidth=.5f;
    _bLogin.layer.borderColor=[[UIColor greenColor]CGColor];
    _bLogin.layer.cornerRadius=10;
    _bLogin.clipsToBounds=YES;
    // Do view setup here.
    

 //[self registerDefaultsFromSettingsBundle];
   
    
     _username.text=[[NSUserDefaults standardUserDefaults]stringForKey:@"login_preference"];//[defaultsToRegister objectForKey:@"login_preference"];
    _password.text=[[NSUserDefaults standardUserDefaults]stringForKey:@"password_preference"];//[defaultsToRegister objectForKey:@"password_preference"];
    //_username.text=
}
- (void)registerDefaultsFromSettingsBundle
{
    NSString *settingsBundle = [[NSBundle mainBundle] pathForResource:@"Settings" ofType:@"bundle"];
    if(!settingsBundle) {
        NSLog(@"Could not find Settings.bundle");
        return;
    }
    
    NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile:[settingsBundle stringByAppendingPathComponent:@"Root.plist"]];
    NSArray *preferences = [settings objectForKey:@"PreferenceSpecifiers"];
    
    defaultsToRegister = [[NSMutableDictionary alloc] initWithCapacity:[preferences count]];
    for(NSDictionary *prefSpecification in preferences) {
        NSString *key = [prefSpecification objectForKey:@"Key"];
        if(key) {
            [defaultsToRegister setObject:[prefSpecification objectForKey:@"DefaultValue"] forKey:key];
        }
    }
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultsToRegister];
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
//5VC19-44Q32-H4JRN-5Y9XH-1UEH5
//NSString *verify_status = [[NSUserDefaults standardUserDefaults]stringForKey:@"verify_status"];