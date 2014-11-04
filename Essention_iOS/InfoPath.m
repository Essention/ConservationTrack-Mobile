//
//  InfoPath.m
//  Essention_iOS
//
//  Created by Oleksii on 10/31/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import "InfoPath.h"

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
     _navbar.title=_spTitle;
    [self GetDataFromIpathFormXml];

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
     //   [self.tableViewMy reloadData];
        [timer invalidate];
     //   self.tableViewMy.hidden=false;
     //   [self.loadGif stopAnimating];
      //  self.loadGif.hidden=true;
        [sp TryLoadFile];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


 #pragma mark - Navigation
 // In a storyboard-based application, you will often want to do a little preparation before navigation
// - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
//     infoPathViewController *infp=[segue destinationViewController];
//     infp.spId=_spId;
     //NSString *tt=segue.identifier;
     
// }




@end
