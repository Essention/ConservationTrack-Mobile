//
//  ViewController.m
//  HelloWorld
//
//  Created by Bujar Muliqi on 2/9/14.
//  Copyright (c) 2014 EssentialCollaboration. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ButtonClick:(id)sender {
    NSLog(self.NameTextBox.text);
}
@end
