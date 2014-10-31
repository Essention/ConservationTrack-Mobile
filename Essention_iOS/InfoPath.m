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
    
    NSInteger *sid = _spId;
    
    infoPathViewController *infp=[infoPathViewController alloc];
    infp.spId=_spId;
  //  _testlabel.text=[NSString stringWithFormat:@"%ld",sid];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


 #pragma mark - Navigation
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    
}
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     infoPathViewController *infp=[segue destinationViewController];
     infp.spId=_spId;

     
 }




@end
