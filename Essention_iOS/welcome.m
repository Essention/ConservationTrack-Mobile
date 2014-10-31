//
//  welcome.m
//  Essention_iOS
//
//  Created by Oleksii on 10/29/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "welcome.h"
#include "LoginEs.h"



@implementation welcome{
    
}
@synthesize theList;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableViewMy.hidden=true;
    [self.loadGif startAnimating];
    // Do any additional setup after loading the view.
    NSString *username =[[NSUserDefaults standardUserDefaults]stringForKey:@"username"];
    _naviBar.title=[NSString stringWithFormat:@"%@ %@", @"Welcome",username];
    
   // _bCreateNew.layer.borderWidth=.5f;
   // _bCreateNew.layer.borderColor=[[UIColor greenColor]CGColor];
    //_bCreateNew.layer.cornerRadius=10;
    _bCreateNew.clipsToBounds=YES;
    //
    array=[[NSMutableArray alloc] init];
    //array=[NSMutableArray arrayWithObjects: @"qwe",@"asdasd",nil];
    sp=[[SP alloc]init];
    //username=
    [sp Get_GetList_Items];
    
  //  while (![sp FlagEnd]) {
        timer= [NSTimer scheduledTimerWithTimeInterval: 2.0
                                                      target: self
                                                    selector:@selector(reload)
                                                    userInfo: nil repeats:YES];
  //  }
    array=[sp CheCkResult];
    
}


- (void)reload {
    if ([sp FlagEnd]) {
        array=[sp CheCkResult];
        [self.tableViewMy reloadData];
        [timer invalidate];
        self.tableViewMy.hidden=false;
        [self.loadGif stopAnimating];
        self.loadGif.hidden=true;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backToLogin:(id)sender {
    
    [self performSegueWithIdentifier:@"backTologIdent" sender:self];
}

#pragma mark - UItable view


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [array count];
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"itemsRow" forIndexPath:indexPath];
    // dequeueReusableCellWithReuseIdentifier:@"folderRow" forIndexPath:indexPath ];
    UILabel *label=(UILabel *)[cell viewWithTag:21];
    theList = [array objectAtIndex:indexPath.row];
    label.text=theList.title;
    return cell;
}
@end
