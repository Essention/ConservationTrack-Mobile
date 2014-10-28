//
//  thirdController.m
//  Essention_iOS
//
//  Created by Oleksii on 10/14/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import "thirdController.h"
@interface thirdController ()

    - (IBAction)getAllImages:(id)sender;



@end

@implementation thirdController{
   NSMutableArray *array;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)viewDidUnload {
    [super viewDidUnload];
}
- (void)dealloc {
    //[output release];
    //[convertToStringData release];
    //[super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    /// coll view
    NSError *error;
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSString *documentsDirectory = [NSHomeDirectory()
                                    stringByAppendingPathComponent:@"Documents"];
    NSLog(@"Documents directory: %@", [fileMgr contentsOfDirectoryAtPath:documentsDirectory error:&error]);
    array=[[NSMutableArray alloc] init];
    array=[fileMgr contentsOfDirectoryAtPath:documentsDirectory error:&error];
   
    
    
    
}


#pragma mark - UItable view


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [array count];
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"folderRow" forIndexPath:indexPath];
                                    // dequeueReusableCellWithReuseIdentifier:@"folderRow" forIndexPath:indexPath ];
    UILabel *label=(UILabel *)[cell viewWithTag:101];
    label.text=[array objectAtIndex:indexPath.row];
    return cell;
}





#pragma mark - UICollectionView Datasource
- (IBAction)getAllImages:(id)sender {
    
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [array count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath ];
    UILabel *label=(UILabel *)[cell viewWithTag:100];
    label.text=[array objectAtIndex:indexPath.row];
    return cell;
    
}

@end