//
//  InfoPath.h
//  Essention_iOS
//
//  Created by Oleksii on 10/31/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "infoPathViewController.h"
#import "SP.h"
#import "SPFormList.h"
#import "List.h"
#import "loadXml.h"
#import "modifyXml.h"
#import "SaveForm.h"



@interface InfoPath : UITableViewController
{
    NSMutableArray *result;
    NSMutableArray *array;
    SPFormList *spList;
    
    SP *sp;
    NSTimer *timer;
    
    NSString *theXml;
    NSString *xmlStringForSend;
    
    // for expand

}
@property NSInteger *spId;
@property NSString *spTitle;
@property (weak, nonatomic) IBOutlet UINavigationItem *navbar;
@property (strong, nonatomic) IBOutlet UITableView *tableviewPArts;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *waitRoll;
@property (strong, nonatomic) IBOutlet UIButton *saveButtton;

-(IBAction)addForm:(id)sender;
// infopath field

@property (strong, nonatomic) IBOutlet UITextField *part1_name;
@property (strong, nonatomic) IBOutlet UITextField *part1_monitdate;
@property (strong, nonatomic) IBOutlet UITextField *part1_nameofmonitor;
@property (strong, nonatomic) IBOutlet UITextField *part1_status;
@property (strong, nonatomic) IBOutlet UITextField *TypeofInstr;
@property (strong, nonatomic) IBOutlet UITextField *TNCWorld;
@property (strong, nonatomic) IBOutlet UITextField *lastmonitor;

- ( IBAction )Edit: ( id )sender;
-(void)FieldEnabled: (bool *)isEnabled;
-(NSString *)getDataFromForm;

@end
