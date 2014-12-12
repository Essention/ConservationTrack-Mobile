//
//  SaveForm.m
//  Essention_iOS
//
//  Created by Oleksii on 12/10/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import "SaveForm.h"

@implementation SaveForm

- (void)viewDidLoad {
 //  NSString *mystring=_theXml;
    
}

-(IBAction)SaveButtonActions: (id)sender{
    //
    
    if ([_fileName.text  isEqual:@""]) {
        _infoLine.text=@"input file name";
        _infoLine.textColor=[UIColor redColor];
        return;
    }
    _nameForm=[NSString stringWithFormat:@"%@.xml",_fileName.text];
    [self saveFormNow];
    
    welcome *NVC = [self.storyboard instantiateViewControllerWithIdentifier:@"NAV01"];
    [self presentViewController:NVC animated:YES completion:nil];
}

-(void) saveFormNow{
    
    SP *sp=[[SP alloc]init];
    [sp Save_xml_In_spFormList:_theXml fileName:_nameForm];
}

@end
