//
//  infoPathViewController.m
//  Essention_iOS
//
//  Created by Oleksii on 10/31/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import "infoPathViewController.h"

@interface infoPathViewController ()

@end

@implementation infoPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _testLabel.text=[NSString stringWithFormat:@"%ld",_spId];
    
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

@end