//
//  InfoPath.m
//  Essention_iOS
//
//  Created by Oleksii on 10/31/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import "InfoPath.h"
//#import "DTCustomColoredAccessory.h"


@interface InfoPath ()

@end

@implementation InfoPath

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableviewPArts.layer.cornerRadius=5;
    _tableviewPArts.layer.borderColor=[UIColor colorWithWhite:0.6 alpha:1].CGColor;
    _tableviewPArts.layer.borderWidth=1;
    _tableviewPArts.separatorColor=[UIColor clearColor];
    
    
     //NSInteger *sid = _spId;
     //NSString *username =[[NSUserDefaults standardUserDefaults]stringForKey:@"spid"];
    
    
    if (_spId!=NULL) {
        _navbar.title=_spTitle;
        [_waitRoll startAnimating];
        _waitRoll.hidden=false;
        _tableviewPArts.tableHeaderView = _waitRoll;
    [self GetDataFromIpathFormXml];
    }
    else{
        
        _tableviewPArts.tableHeaderView = _saveButtton;
        //_tableviewPArts.tableFooterView = _saveButtton;
        _tableviewPArts.tableHeaderView.layer.backgroundColor=[UIColor colorWithWhite:0.6 alpha:1].CGColor;

        _navbar.title=@"New Monitoring Reports";
        [self newMonReport];
    }

}
- ( IBAction )Edit: ( id )sender{
    NSString *flag=self.navigationItem.rightBarButtonItem.title;
    
    if ([flag isEqualToString: @"Edit"]) {
        [self FieldEnabled:TRUE];
    }
    else if ([flag isEqualToString:@"Save"]){
        [self FieldEnabled:FALSE];
        
        //edit save
        xmlStringForSend=[self getDataFromForm];
        
        SaveForm *sF = [[SaveForm alloc] init];
        sF.theXml = xmlStringForSend;
        sF.nameForm=_spTitle;
        [sF saveFormNow];

    }
    
    
    
}
-(void)newMonReport{
    loadXml *lxml=[[loadXml alloc] init];
    NSData *data=[lxml loadParty];
    theXml=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
   

}
-(void)GetDataFromIpathFormXml{
    
    array=[[NSMutableArray alloc] init];
    sp=[[SP alloc]init];
    [sp Get_AttaUrl :_spId];
    timer= [NSTimer scheduledTimerWithTimeInterval: 2.0
                                            target: self
                                          selector:@selector(reload)
                                          userInfo: nil repeats:YES];
    array=[sp CheCkResult];
}
- (void)reload {
    if ([sp FlagEnd]) {
        array=[sp CheCkResult];
        
        [timer invalidate];
        
        List *allPAramfromXML=[[List alloc] init];
        allPAramfromXML=[array objectAtIndex:0];
        NSString *nameFileReport=allPAramfromXML.LinkFilename;
        [sp TryLoadFile:nameFileReport];
        timer= [NSTimer scheduledTimerWithTimeInterval: 2.0
                                                target: self
                                              selector:@selector(reloadFileGet)
                                              userInfo: nil repeats:YES];
    }
    
}
- (void)reloadFileGet {
    
    if ([sp FlagEnd]) {
        spList=[sp CheckSPResult];
        theXml=sp.response;
        [timer invalidate];
        [self FillForm];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) FillForm{
    
    
    [self FieldEnabled:false];
    _part1_name.text=spList._Name_PropertyName;
    _part1_monitdate.Text=spList._MonitoringDate;
    _part1_status.Text=spList._Status;
    _TypeofInstr.Text=spList._TypeofInterest;
    _TNCWorld.Text=spList._TNCInterestAcres;
    _lastmonitor.Text=spList._LastMonitoringDate_PrevYear;
    
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit"  style:  UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.rightBarButtonItem = rightButton;
    rightButton.target = self;
    rightButton.action = @selector( Edit: );
    
    [_waitRoll stopAnimating];
    //_waitRoll.frame = CGRectMake(0, 0, 320, 44);
    //[_tableviewPArts setTableHeaderView:<#(UIView *)#>]
    _waitRoll.hidden=true;
    
    [_tableviewPArts sizeToFit];
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect oldFrame = _tableviewPArts.tableHeaderView.frame;
       _tableviewPArts.tableHeaderView.frame = CGRectMake(oldFrame.origin.x, oldFrame.origin.y, oldFrame.size.width, 0);
        [_tableviewPArts setTableHeaderView:_tableviewPArts.tableHeaderView];
    }];
}

-(void)FieldEnabled: (BOOL *)isEnabled{

    if (isEnabled) { 
        self.navigationItem.rightBarButtonItem.title=@"Save";
        //  NSString *rr=theXml;
        
    }
    else{   //save form
        //
        self.navigationItem.rightBarButtonItem.title=@"Edit";
        
    }
    
    _part1_name.userInteractionEnabled=isEnabled;
    _part1_monitdate.userInteractionEnabled=isEnabled;
    _part1_status.userInteractionEnabled=isEnabled;
    _TypeofInstr.userInteractionEnabled=isEnabled;
    _TNCWorld.userInteractionEnabled=isEnabled;
    _lastmonitor.userInteractionEnabled=isEnabled;
    
}
- (IBAction)addForm:(id)sender {
    
    xmlStringForSend=[self getDataFromForm];
    
    
}
-(NSString *)getDataFromForm{
    
    SPFormList *newData=[[SPFormList alloc]init];
    NSMutableDictionary *fieldsDic=[[NSMutableDictionary alloc]init];
    modifyXml *theModify=[[modifyXml alloc] init];
    [theModify setArrayList:newData xml:theXml];
    fieldsDic=theModify.mapDictionary;
    [fieldsDic setValue:_part1_name.text forKey:@"my:PropertyName"];
    [fieldsDic setValue:_part1_monitdate.text forKey:@"my:MonitoringDate"];
    [fieldsDic setValue:_part1_status.text forKey:@"my:Status"];
    [fieldsDic setValue:_TypeofInstr.text forKey:@"my:TypeofInterest"];
    [fieldsDic setValue:_TNCWorld.text forKey:@"my:TNCInterestAcres"];
    [fieldsDic setValue:_lastmonitor.text forKey:@"my:LastMonitoringDate_PrevYear"];
    
    return [theModify modXml:fieldsDic];
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"saveAs"]) {
        SaveForm *nextVC = (SaveForm *)[segue destinationViewController];
        nextVC.theXml = xmlStringForSend;
      //  SaveForm *sForm=[[SaveForm alloc] init];
      //  sForm.theXml=xmlStringForSend;
    }
}

@end
