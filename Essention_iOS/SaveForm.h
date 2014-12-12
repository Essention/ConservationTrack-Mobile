//
//  SaveForm.h
//  Essention_iOS
//
//  Created by Oleksii on 12/10/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SP.h"
#import "welcome.h"


@interface SaveForm : UIViewController

@property NSString *theXml;
@property NSString *nameForm;

@property (strong, nonatomic) IBOutlet UILabel *infoLine;
@property (strong, nonatomic) IBOutlet UITextField *fileName;

- (IBAction)SaveButtonActions:(id)sender;
-(void) saveFormNow;
@end
