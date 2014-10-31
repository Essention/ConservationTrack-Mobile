//
//  welcome.h
//  Essention_iOS
//
//  Created by Oleksii on 10/29/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SP.h"
#import "List.h"

@interface welcome : UIViewController <UIImagePickerControllerDelegate,
UINavigationControllerDelegate,
NSXMLParserDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
UITableViewDataSource,
UITableViewDelegate>
{
    NSMutableArray *result;
    NSMutableArray *array;
    SP *sp;
    NSTimer *timer;
    
}
@property (retain, nonatomic) IBOutlet UITableView *tableViewMy;
@property (weak, nonatomic) IBOutlet UIButton *bCreateNew;
@property (weak, nonatomic) IBOutlet UINavigationItem *naviBar;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadGif;

@property(nonatomic,retain) List *theList;
- (IBAction)backToLogin:(id)sender;
-(void) teblViewReload;
- (void)reload;

@end
