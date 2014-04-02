//
//  ViewController.h
//  HelloWorld
//
//  Created by Bujar Muliqi on 2/9/14.
//  Copyright (c) 2014 EssentialCollaboration. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSXMLParserDelegate>{
    
    NSMutableData *webData;
    NSXMLParser *xmlParser;
    NSString *finaldata;
    NSString *convertToStringData;
    NSMutableString *nodeContent;
    
}
@property (strong, nonatomic) IBOutlet UILabel *output;
- (IBAction)ButtonClick:(id)sender;
- (IBAction)invokeService;
- (IBAction)connection;
@property (strong, nonatomic) IBOutlet UITextField *NameTextBox;

@end
