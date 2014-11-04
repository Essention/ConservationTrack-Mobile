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

@interface InfoPath : UITableViewController
{
    NSMutableArray *result;
    NSMutableArray *array;
    SP *sp;
    NSTimer *timer;
    
}
@property NSInteger *spId;
@property NSString *spTitle;
@property (weak, nonatomic) IBOutlet UINavigationItem *navbar;
@property (strong, nonatomic) IBOutlet UITableView *tableviewPArts;

// infopath field

@property (strong, nonatomic) IBOutlet UITextField *part1_name;
@property (strong, nonatomic) IBOutlet UITextField *part1_monitdate;
@property (strong, nonatomic) IBOutlet UIView *part1_nameofmonitor;
@property (strong, nonatomic) IBOutlet UITextField *part1_status;


@end
