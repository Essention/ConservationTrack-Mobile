//
//  LoginEs.h
//  Essention_iOS
//
//  Created by Oleksii on 10/28/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginEs : UIViewController
{
NSMutableDictionary *defaultsToRegister;
}
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

- (IBAction)bLogin:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *bLogin;


@end
