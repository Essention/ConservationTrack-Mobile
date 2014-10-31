
//  Essention_iOS
//
//  Created by Oleksii on 10/29/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SP : NSObject <UIImagePickerControllerDelegate, UINavigationControllerDelegate, NSXMLParserDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    NSMutableData *webData;
    NSMutableString *nodeContent;
    NSMutableArray *resultList;
    ////////////
    BOOL flagEndConnection;
    
}
@property (nonatomic, readwrite)    NSString *response;
@property(strong,nonatomic)      NSMutableArray *listArray;

-(void)Get_GetList_Items;
-(NSMutableArray *) CheCkResult;
-(BOOL)FlagEnd;

@end
